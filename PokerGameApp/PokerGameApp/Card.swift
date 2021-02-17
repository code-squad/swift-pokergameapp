//
//  Card.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/16.
//

import Foundation

struct Card: CustomStringConvertible {
    private let rank: Rank
    private let suit: Suit
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    var description: String {
        return "\(suit)\(rank)"
    }
}
