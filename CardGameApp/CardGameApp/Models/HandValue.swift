//
//  HandValue.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct HandValue {
    private var hand: [Card]!
    private var combination: [[Card]] = []
    
    private(set) var value: Value!
    
    init(hand: [Card]) {
        self.hand = hand
        setupValue()
    }
    
    var combinationOf: [Value: [[Card]]] = [:]
    
    mutating func setupValue() {
        var values: [Value] = []
        
        let straight = searchStraight()
        let highestPair = searchPairs()
        
//        values.append(straight)
        values.append(highestPair)
        
        value = values.sorted(by: >).first!
    }
    
    private mutating func searchStraight() -> Value {
        let sortedHand = hand.sorted(by: <)
        return .straight
    }
    
    private mutating func searchPairs() -> Value {
        var values: [Value] = []
        
        var rankCountDict: [Card.Rank: Int] = [:]
        hand.forEach { (card) in
            rankCountDict[card.rank] = (rankCountDict[card.rank] ?? 0) + 1
        }
                
        rankCountDict.forEach { (rank, count) in
            let value = Value(count: count)
            values.append(value)
            combinationOf[value] = searchCombinations(of: rank)
        }
        
        var onePairCount = 0
        values.forEach {
            if $0 == .onePair { onePairCount += 1 }
        }
        if onePairCount >= 2 {
            values.append(.twoPairs)
        }
        
        return values.sorted(by: >).first!
    }
    
    private mutating func searchCombinations(of rank: Card.Rank) -> [[Card]] {
        var combinations: [[Card]] = []
        hand.forEach { (card) in
            var combination: [Card] = []
            if card.rank == rank {
                combination.append(card)
            }
            combinations.append(combination)
        }
        return combinations
    }
}

enum Value: Int, Equatable {
    case highCard = 1, onePair, twoPairs, triple, straight, fourCards
    
    init(count: Int) {
        switch count {
        case 2:
            self = .onePair
        case 3:
            self = .triple
        case 4:
            self = .fourCards
        default:
            self = .highCard
        }
    }
    
    static func > (lhs: Value, rhs: Value) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }
}
