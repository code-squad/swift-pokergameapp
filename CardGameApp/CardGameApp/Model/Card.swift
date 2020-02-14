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
        
        var nextRank: Rank? {
            guard let nextRank = Rank.init(rawValue: self.rawValue + 1) else { return nil }
            return nextRank
        }
    }
    private var shape: Shape
    private var rank: Rank
    
    init (shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    func nextCard() -> Card? {
        guard let nextRank = Rank.init(rawValue: self.rank.rawValue + 1) else { return nil }
        return Card(shape: self.shape, rank: nextRank)
    }
}

extension Card: CustomStringConvertible, Equatable, Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue > rhs.rank.rawValue
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
