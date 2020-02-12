//
//  Card.swift
//  CardGameApp
//
//  Created by JW on 2020/02/10.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible{
    enum Suit: String {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
    }
    
    enum Rank: Int {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
    }
    
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    var description: String {
        let rankString: String
        switch self.rank {
        case .ace:
            rankString = "A"
        case .jack:
            rankString = "J"
        case .queen:
            rankString = "Q"
        case .king:
            rankString = "K"
        default :
            rankString = "\(self.rank.rawValue)"
        }
        return "\(suit.rawValue)\(rankString)"
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }
}
