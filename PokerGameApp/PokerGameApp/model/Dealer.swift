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
    
    func sendCard(to player : Player) {
        do {
            let drawCard = try deck.popOneCard()
            player.receiveCard(with: drawCard)
        }
        catch{
            print(error)
        }
    }
    
    func printDeck() {
        print(deck)
    }
}
