//
//  Card.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/06.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Card {
    enum Suit: String {
        case heart = "♥️"
        case diamond = "♦️"
        case club = "♣️"
        case spade = "♠️"
    }
    
    private let suit: Suit
    private let number: Int
    
    init(suit: Suit, number: Int) {
        self.suit = suit
        self.number = number
    }
}
