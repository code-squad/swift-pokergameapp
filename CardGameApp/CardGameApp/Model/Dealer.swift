//
//  Dealer.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Dealer: Player {
    
    private var deck: Deck = Deck()
    
    init() {
        super.init(identifier: "Dealer")
    }
    
    func shuffle() {
        deck.shuffle()
    }
    
    func pushCard() -> Card? {
        return deck.removeOne()
    }
}

