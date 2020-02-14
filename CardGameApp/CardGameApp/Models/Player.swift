//
//  Player.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/08.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Player {
    private(set) var hand: [Card] = []
    private(set) var name: String!
    private(set) var handValue: HandValue!
    
    func setupHand(with hand: [Card]) {
        self.hand = hand
    }
    
    func setupName(_ name: String) {
        self.name = name
    }
    
    func forEachCard(_ handler: (Card) -> ()) {
        for card in hand {
            handler(card)
        }
    }
    
    func setupHandValue() {
        handValue = HandValue(hand: hand)
    }
}

