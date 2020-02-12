//
//  Hand.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/12.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Hand {
    private var cards = [Card]()
    
    func forEach(_ transform: (Card) -> ()) {
        cards.forEach(transform)
    }
    
    func add(card: Card) {
        cards.append(card)
    }
}
