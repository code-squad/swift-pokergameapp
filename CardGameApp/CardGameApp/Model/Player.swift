//
//  Player.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Player {
    private var hand = Hand()
    
    func forEach(_ transform: (Card) -> ()) {
        hand.forEach(transform)
    }
    
    func discard() {
        hand = Hand()
    }
    
    func receive(_ card: Card) {
        hand.add(card: card)
    }
}
