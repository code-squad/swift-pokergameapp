//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

class Dealer: Player {
    private var deck : Deck
    
    override init() {
        self.deck = Deck.init()
        self.deck.newDeck()
        super.init()
    }
    
    func shuffleDeck() {
        deck.shuffle()
    }
    
    func sendCard(to player : Player, howMany : Int) {
        do {
            for _ in 0..<howMany {
                let drawCard = try deck.popOneCard()
                player.receiveCard(with: drawCard)
            }
        }
        catch{
            print(error)
        }
    }
    
    func sendStartHand(to players : Players, howMany cardCount : Int) {
        sendCard(to: self, howMany: cardCount)
        for player in players.allPlayers() {
            sendCard(to: player, howMany: cardCount)
        }
    }
    
    func printDeck() {
        print(deck)
    }
    
    override func printSelf() {
        print("딜러 [\(showHandAsString())]")
    }
    
    private func newDeck() {
        self.deck.newDeck()
    }
    
    override func resetSelf() {
        super.resetSelf()
        newDeck()
    }
}
