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
    
    enum Pattern: Character, CaseIterable {
        case spade = "♠️"
        case clover = "♣️"
        case heart = "♥️"
        case diamond = "♦️"
    }
    
    enum Number: Int, CaseIterable {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
    }

}

extension Card: CustomStringConvertible {

    var description: String {
        var imageNumber = ""
        var imagePattern = ""

        switch self.pattern {
        case .clover:
            imagePattern = "c"
        case .diamond:
            imagePattern = "d"
        case .heart:
            imagePattern = "h"
        case .spade:
            imagePattern = "s"
        }
        
        switch self.number {
        case .one:
            imageNumber = "A"
        case .two:
            imageNumber = "2"
        case .three:
            imageNumber = "3"
        case .four:
            imageNumber = "4"
        case .five:
            imageNumber = "5"
        case .six:
            imageNumber = "6"
        case .seven:
            imageNumber = "7"
        case .eight:
            imageNumber = "8"
        case .nine:
            imageNumber = "9"
        case .ten:
            imageNumber = "10"
        case .eleven:
            imageNumber = "J"
        case .twelve:
            imageNumber = "Q"
        case .thirteen:
            imageNumber = "K"
        }
        return imagePattern + imageNumber
    }

}

extension Card: Equatable, Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.number.rawValue < rhs.number.rawValue
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        return lhs.number.rawValue > rhs.number.rawValue
    }
    
    static func >> (lhs: Card, rhs: Card) -> Bool {
        return lhs.number.rawValue + 1 != rhs.number.rawValue
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.number == rhs.number && lhs.pattern == rhs.pattern
    }
    
    static func <= (lhs: Card, rhs: Card) -> Bool {
        return lhs.number.rawValue <= rhs.number.rawValue
    }
}
