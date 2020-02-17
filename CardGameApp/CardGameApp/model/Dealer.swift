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
    
    func drawCard(studType: GameMode.StudType) -> [Card?] {
        var drawDeck = [Card?]()
        
        for _ in 1 ... studType {
            let card = self.cardDeck.removeOne()
            drawDeck.append(card)
        }
        
        return drawDeck
    }
    
    func checkCardAmount() -> Int {
        return self.cardDeck.count()
    }
}
