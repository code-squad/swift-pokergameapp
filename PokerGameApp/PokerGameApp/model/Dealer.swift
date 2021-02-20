//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

class Dealer: Player {
    private var deck : Deck
    
    init() {
        self.deck = Deck.init()
        self.deck.newDeck()
        super.init(name: "딜러")
    }
    
    func shuffleDeck() {
        deck.shuffle()
    }
    
    /// if fail, return false
    func sendCard(to player : Player, howMany : Int) -> Bool {
        do {
            for _ in 0..<howMany {
                let drawCard = try deck.popOneCard()
                player.receiveCard(with: drawCard)
            }
        }
        catch{
            return false
        }
        return true
    }
    
    /// if fail, return false
    func sendStartHand(to players : Players, howMany cardCount : Int) -> Bool {
        if sendCard(to: self, howMany: cardCount) == false {
            return false
        }
        
        for player in players.allPlayers() {
            if sendCard(to: player, howMany: cardCount) == false {
                return false
            }
        }
        
        return true
    }
    
    private func newDeck() {
        self.deck.newDeck()
    }
    
    override func resetSelf() {
        super.resetSelf()
        newDeck()
    }
}
