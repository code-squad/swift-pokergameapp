//
//  Dealer.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

class Dealer {
    private var cardDeck = CardDeck()
    private var deck = Deck()
    private let name = "딜러"
    
    init() {
        cardDeck.shuffle()
    }
    
    func receiveCard(deck : CardDeck, players : [Players]) {
        
    }
    
    
}
