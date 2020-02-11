//
//  CardDeck.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/07.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards = [Card]()
    
    var count: Int {
        return cards.count
    }
    
    init() {
        Card.Suit.allCases.forEach { suit in
            Card.Rank.allCases.forEach { rank in
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func shuffle<T: RandomNumberGenerator>(using generator: T) {
        var randomGenerator = generator
        cards.shuffle(using: &randomGenerator)
    }
    
    mutating func removeOne() -> Card {
        return cards.removeFirst()
    }
    
    mutating func reset() {
        self = Self.init()
    }
}
