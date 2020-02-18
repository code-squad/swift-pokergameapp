//
//  CardDeck.swift
//  CardGameApp
//
//  Created by delma on 06/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
struct CardDeck {
    private var hands = Hands()
    
    init() {
        Card.Number.allCases.map { number in
            Card.Pattern.allCases.map{ pattern in
                hands.append(Card(number: number, pattern: pattern ))
            }
        }
    }
    
    func count() -> Int {
        return hands.count()
    }
    
    mutating func shuffle() {
        hands.shuffle()
    }
    
    mutating func removeOne() -> Card? {
        return hands.removeOne()
    }
    
    mutating func reset() {
        self = .init()
    }
    
}
