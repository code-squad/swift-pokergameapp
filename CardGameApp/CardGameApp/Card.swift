//
//  Card.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/07.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Card {
    enum Shape: String, CaseIterable {
        case heart = "h", spade = "s", clover = "c", diamond = "d"
    }
    enum Rank: Int, CaseIterable {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
    }
    private var shape: Shape
    private var rank: Rank

    init (shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
}

extension Card: CustomStringConvertible, Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return "\(lhs)" == "\(rhs)"
    }
    
    var description: String {
        switch rank {
        case .A, .J, .Q, .K:
            return "\(shape.rawValue)\(rank)"
        default:
            return "\(shape.rawValue)\(rank.rawValue)"
        }
    }
}
