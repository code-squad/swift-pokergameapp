//
//  Player.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Player {
    private var hand = [Card]()
    var handCount: Int {
        hand.count
    }
    
    func forEach(_ tramsform: (Card) -> ()) {
        hand.forEach(tramsform)
    }
    func discard() {
        hand = [Card]()
    }
    
    func receive(_ card: Card) {
        hand.append(card)
    }
}
