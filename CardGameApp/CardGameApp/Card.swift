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
        
        func transformUniqueNumber(number: Number) -> String {
            switch number {
            case .one:
                return "A"
            case .eleven:
                return "J"
            case .twelve:
                return "Q"
            case .thirteen:
                return "K"
            default:
                return "\(number)"
            }
        }
    }
    
}

