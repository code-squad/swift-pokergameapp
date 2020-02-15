//
//  Card.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/14.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

struct Card: CustomStringConvertible {
    enum Suit: Character {
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
    }

    enum Rank: Int {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
    }

    let suit: Suit, rank: Rank
    
    var description: String {
        switch rank {
        case .A, .J, .Q, .K:
            return "\(suit.rawValue)\(rank)"
        default:
            return "\(suit.rawValue)\(rank.rawValue)"
        }
    }
}
