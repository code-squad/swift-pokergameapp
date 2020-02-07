//
//  Card.swift
//  CardGameApp
//
//  Created by delma on 06/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Card {
    var number: Number
    var pattern: Pattern
    
    init(number: Number, pattern: Pattern) {
        self.number = number
        self.pattern = pattern
    }
    
    enum Pattern: Character {
        case spade = "♠️"
        case clover = "♣️"
        case heart = "♥️"
        case diamond = "♦️"
    }
    
    enum Number: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
    }
    
}

extension Card: CustomStringConvertible {
    var description: String {
        var numberCharacter = ""
        switch self.number {
        case .one:
            numberCharacter = "A"
        case .eleven:
            numberCharacter = "J"
        case .twelve:
            numberCharacter = "Q"
        case .thirteen:
            numberCharacter = "K"
        default:
            numberCharacter = "\(self.number)"
        }
        return "\(pattern.rawValue) \(numberCharacter)"
    }
}
