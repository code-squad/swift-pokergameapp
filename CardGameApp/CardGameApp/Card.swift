//
//  Card.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/14.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

struct Card: CustomStringConvertible, Equatable {
    enum Suit: Character, CaseIterable {
        case spades = "s", hearts = "h", diamonds = "d", clubs = "c"
    }

    enum Rank: Int, CaseIterable, Comparable {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
        static func < (lhs: Self, rhs: Self) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        static func isNext(previous: Self, next: Self) -> Bool {
            return (next.rawValue - previous.rawValue) == 1 ? true : false
        }
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
