//
//  Card.swift
//  CardGameApp
//
//  Created by JW on 2020/02/10.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible{
    enum Suit: String, CaseIterable {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
    }
    
    enum Rank: Int, CaseIterable, CustomStringConvertible {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        
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
            default :
                return "\(self.rawValue)"
            }
        }
    }
    
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    var description: String {
        return "\(suit.rawValue)\(rank)"
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }
}
