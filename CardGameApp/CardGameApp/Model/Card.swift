//
//  Card.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/28.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Card {
    
    enum Suit: CaseIterable {
        case spade
        case heart
        case club
        case diamond
    }
    
    enum Rank: Int, CaseIterable {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        
        func neighborRank(index: Int) -> Rank {
            Rank(rawValue: self.rawValue + index) ?? .one
        }
    }
    
    private var suit: Suit
    private var rank: Rank

    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}

extension Card: CustomStringConvertible, Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        lhs.rank.rawValue < rhs.rank.rawValue
    }
    
    var description: String {
        return self.suit.description + self.rank.description
    }
    
    var value: Int {
        return rank.rawValue
    }
}

extension Card.Rank: CustomStringConvertible {
    var description: String {
        switch self {
        case .one: return "A"
        case .eleven: return "J"
        case .twelve: return "Q"
        case .thirteen: return "K"
        default: return String(rawValue)
        }
    }
}

extension Card.Suit: CustomStringConvertible {
    var description: String {
        switch self {
        case .club: return "c"
        case .diamond: return "d"
        case .heart: return "h"
        case .spade: return "s"
        }
    }
}
