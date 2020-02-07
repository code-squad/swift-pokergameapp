//
//  Deck.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/07.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

struct Deck {
    var cards = [Card]()
    var count: Int {
        cards.count
    }
    
    mutating func reset() {
        Card.Shape.allCases.forEach {
            let shape = $0
            Card.Rank.allCases.forEach {
                cards.append(Card(shape: shape, rank: $0))
            }
        }
    }
}
