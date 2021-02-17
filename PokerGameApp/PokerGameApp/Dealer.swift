//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class Dealer: Player {
    
    var cardDeck: CardDeck
    
    override init() {
        cardDeck = CardDeck()
        super.init()
    }
}
