//
//  Trump.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/10.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol CardSearchable {
    
    func searchCard(handler: (Card) -> (Void))
    
}

struct Card {
    
    enum Suit: CaseIterable {
        case spade
        case heart
        case diamond
        case club
    }
    
    enum Number: Int, CaseIterable {
        case ace = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case jack
        case queen
        case king
    }
    
    private let suit: Suit
    private let number: Number
    
    init(suit: Suit, number: Number) {
        self.suit = suit
        self.number = number
    }
    
}

extension Card: Comparable {
    
    public static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.number == rhs.number
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.number < rhs.number
    }
    
    func isEqual(other card: Card, distance: Int) -> Bool {
        return self.number.isEqual(other: card.number, distance: distance)
    }
}

extension Card: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
}

extension Card: CustomStringConvertible {
    
    public var description: String {
        return suit.description + number.description
    }
}

extension Card.Suit: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .spade :
            return "s"
        case .heart :
            return "h"
        case .diamond :
            return "d"
        case .club :
            return "c"
        }
    }
    
}

extension Card.Number: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(self.rawValue)
        }
    }
    
}

extension Card.Number: Comparable {
    
    static func == (lhs: Card.Number, rhs: Card.Number) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    static func < (lhs: Card.Number, rhs: Card.Number) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    func isEqual(other: Card.Number, distance: Int) -> Bool {
        return self.rawValue == other.rawValue + distance
    }
}

