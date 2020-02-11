//
//  CardModel.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Card {
    
    enum suit {
        case spade
        case hert
        case club
        case diamond
    }
    
    enum rank: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
    }
    
    var suit: suit
    var rank: rank
    private var value: String {
        switch self.rank {
        case .one:
            return "A"
        case .eleven:
            return "J"
        case .twelve:
            return "Q"
        case .thirteen:
            return "K"
        default:
            return String(self.rank.rawValue)
        }
    }
    private var shape: String {
        switch self.suit {
        case .spade:
            return "♤"
        case .club:
            return "♧"
        case .hert:
            return "❤"
        case .diamond:
            return "⬦"
        }
    }

    init(suit: suit, rank: rank) {
        self.suit = suit
        self.rank = rank
    }
    
    func fetchInformation() -> String {
        return "\(shape)\(value)"
    }
}


