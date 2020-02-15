//
//  Trump.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/10.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct Card {
    enum Suit: String, CaseIterable {
        case spade = "s"
        case heart = "h"
        case diamond = "d"
        case club = "c"
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

extension Card: CustomStringConvertible {
    public var description: String {
        return suit.description + number.description
    }
}

extension Card.Suit: CustomStringConvertible {
    var description: String {
        switch self {
        case .spade :
            return "♠"
        case .heart :
            return "♥"
        case .diamond :
            return "♦"
        case .club :
            return "♣"
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

extension Card: Equatable {
    public static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit && lhs.number == rhs.number
    }
}
