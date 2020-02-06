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
    
    private let numberFormattingDictionary = [1: "A", 11: "J", 12: "Q", 13: "K"]
    
    init(suit: Suit, number: Int) {
        self.suit = suit
        self.number = number
    }
}

extension Card: CustomStringConvertible {
    var formattedNumber: String {
        if let string = numberFormattingDictionary[number] {
            return string
        }
        return "\(number)"
    }
    
    var description: String {
        return "\(suit.rawValue)\(formattedNumber)"
    }
}
