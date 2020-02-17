//
//  Dealer.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/16.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Dealer: Player {
    private var cardDeck: CardDeck
    
    override init() {
        self.cardDeck = CardDeck()
        super.init()
    }
    
    func shuffle() {
        self.cardDeck.shuffle()
    }
    
    func drawCard() -> Card? {
        return cardDeck.removeOne()
    }
    
    func checkCardAmount() -> Int {
        return self.cardDeck.count()
    }
}
