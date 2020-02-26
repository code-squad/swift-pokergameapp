//
//  Dealer.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Dealer: Player {
    private var cardDeck = CardDeck()

    func removeOne() -> Card? {
        return cardDeck.removeOne()
    }
    
    func leftCards() -> Int {
        return cardDeck.count()
    }
    
    func shuffle() {
        cardDeck.shuffle()
    }

}
