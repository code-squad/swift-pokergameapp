//
//  Card.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/05.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct Card {
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    enum Suit: Character, CaseIterable, CustomStringConvertible {
        var description: String {
            return String(self.rawValue)
        }
        
        case spade = "s"
        case heart = "h"
        case club = "c"
        case diamond = "d"
    }
    
    enum Rank: Int, CaseIterable, CustomStringConvertible, Equatable {
        var description: String {
            switch self {
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            case .ace:
                return "A"
            default:
                return String(self.self.rawValue)
            }
        }
        
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
        static func == (lhs: Rank, rhs: Rank) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
        
        static func < (lhs: Rank, rhs: Rank) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        static func > (lhs: Rank, rhs: Rank) -> Bool {
            return lhs.rawValue > rhs.rawValue
        }
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit &&
            lhs.rank == rhs.rank
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank > rhs.rank
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank < rhs.rank
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(suit)\(rank)"
    }
}
