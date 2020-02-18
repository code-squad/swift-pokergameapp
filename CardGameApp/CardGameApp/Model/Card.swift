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
        
        func isNextRank(with rank: Rank) -> Bool {
            return self.rawValue + 1 == rank.rawValue
        }
    }
    private var shape: Shape
    private var rank: Rank
    
    init (shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    func isNextCard(with card: Card) -> Bool {
        if self.rank.isNextRank(with: card.rank) {
            return true
        }
        return false
    }
}

extension Card: CustomStringConvertible, Equatable, Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue > rhs.rank.rawValue
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue < rhs.rank.rawValue
    }
    
    var description: String {
        switch rank {
        case .A, .J, .Q, .K:
            return "\(shape.rawValue)\(rank)"
        default:
            return "\(shape.rawValue)\(rank.rawValue)"
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.rank)
    }
}
