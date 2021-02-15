//
//  Card.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import Foundation

struct Card: CustomStringConvertible {
    let value: CardValue
    let suit: Suit
    
    init(value: CardValue, suit: Suit) {
        self.value = value
        self.suit = suit
    }
    
    var description: String {
        return "\(suit)\(value.display)"
    }
}
