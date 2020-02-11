//
//  Dealer.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Dealer {
    private var deck = CardDeck()
    private var communityCards: [Card] = []
    
    init() {
        setupDeck()
        setupCommunityCards()
    }
    
    func setupDeck() {
        deck.shuffle()
    }
    
    func setupCommunityCards() {
        
    }
}
