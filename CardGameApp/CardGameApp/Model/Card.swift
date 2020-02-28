//
//  Card.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/28.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Card {
    
    enum suit: CaseIterable {
        case spade
        case heart
        case club
        case diamond
    }
    
    enum rank: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
    }
    
    private var suit: suit
    private var rank: rank

    init(suit: suit, rank: rank) {
        self.suit = suit
        self.rank = rank
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return self.suit.description + self.rank.description
    }
}

extension Card.rank: CustomStringConvertible {
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

extension Card.suit: CustomStringConvertible {
    var description: String {
        switch self {
        case .club: return "c"
        case .diamond: return "d"
        case .heart: return "h"
        case .spade: return "s"
        }
    }
}
