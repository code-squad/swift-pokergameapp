//
//  Dealer.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Dealer: Player {
    private var deck = Deck()
    
    override init(name: String = "Dealer") {
        super.init(name: name)
        setupDeck()
    }
    
    private func setupDeck() {
        deck.shuffle()
    }
    
    func drawCard() -> Card? {
        return deck.removeOne()
    }
}

