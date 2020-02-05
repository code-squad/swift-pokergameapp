//
//  Card.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/05.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Card {
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    enum Suit: String {
        case spade = "♠"
        case heart = "♡"
        case club = "♣"
        case diamond = "⬦"
    }
    
    func toString() -> String {
        var rank = ""
        switch self.rank {
        case .jack:
            rank = "J"
        case .queen:
            rank = "Q"
        case .king:
            rank = "K"
        case .ace:
            rank = "A"
        default:
            rank = String(self.rank.rawValue)
        }
        return "\(suit.rawValue)\(rank)"
    }
    
    enum Rank: Int {
        case king = 13
        case queen = 12
        case jack = 11
        case ten = 10
        case nine = 9
        case eight = 8
        case seven = 7
        case six = 6
        case five = 5
        case four = 4
        case three = 3
        case two = 2
        case ace = 1
    }
}
