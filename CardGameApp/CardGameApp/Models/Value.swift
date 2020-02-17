//
//  Value.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/17.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct Value {
    private var hand: [Card] = []
    private var handRanking: HandRanking = .highCard
    private var combination: [[Card]] = []
    private var lastOfCards: [Card] = []
    private var combinationOf: [HandRanking: [[Card]]] = [:]
    
    mutating func setupValue() {
        var handRankings: [HandRanking] = []
        
        let straight = searchStraight()
        let highestPair = searchPairs()
        
//        values.append(straight)
        handRankings.append(highestPair)
        handRanking = handRankings.sorted(by: >).first!
        
        
        hand.forEach { (cardOfHand) in
            combinationOf[handRanking]!.forEach { (combination) in
                combination.forEach { (combiCard) in
                    if cardOfHand != combiCard { lastOfCards.append(cardOfHand) }
                }
            }
        }
        lastOfCards.sort(by: <)
    }
    
    private mutating func searchStraight() -> HandRanking {
        let sortedHand = hand.sorted { $0.rank < $1.rank }
        // rank 설정
        return .straight
    }
    
    private mutating func searchPairs() -> HandRanking {
        var handRankings: [HandRanking] = []
        
        var rankCountDict: [Card.Rank: Int] = [:]
        hand.forEach { (card) in
            rankCountDict[card.rank] = (rankCountDict[card.rank] ?? 0) + 1
        }
        
        rankCountDict.forEach { (rank, count) in
            let handRanking = HandRanking(count: count)
            handRankings.append(handRanking)
            combinationOf[handRanking] = searchCombinations(of: rank)
        }
        
        var onePairCount = 0
        handRankings.forEach {
            if $0 == .onePair { onePairCount += 1 }
        }
        if onePairCount >= 2 {
            handRankings.append(.twoPairs)
            var onePairs = combinationOf[.onePair]!
            onePairs.sort(by: { $0.first! > $1.first! })
            if onePairs.count > 2 { onePairs.removeLast() }
            combinationOf[.twoPairs] = onePairs
        }
        
        return handRankings.sorted(by: >).first!
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

extension Value: Equatable {
    static func == (lhs: Value, rhs: Value) -> Bool {
        let sortedLhs = lhs.hand.map{ $0.rank }.sorted(by: <)
        let sortedRhs = rhs.hand.map{ $0.rank }.sorted(by: <)
        return sortedLhs == sortedRhs
    }
    
    static func > (lhs: Value, rhs: Value) -> Bool {
        let lhsRanks = lhs.lastOfCards.map{ $0.rank }
        let rhsRanks = rhs.lastOfCards.map{ $0.rank }
        
        if lhs.handRanking == rhs.handRanking {
            for index in 0..<lhs.lastOfCards.count {
                if lhsRanks[index] > rhsRanks[index] { return true }
            }
        }
        return false
    }
    
    static func < (lhs: Value, rhs: Value) -> Bool {
        let lhsRanks = lhs.lastOfCards.map{ $0.rank }
        let rhsRanks = rhs.lastOfCards.map{ $0.rank }
        
        if lhs.handRanking == rhs.handRanking {
            for index in 0..<lhs.lastOfCards.count {
                if lhsRanks[index] < rhsRanks[index] { return true }
            }
        }
        return false
    }
}

enum HandRanking: Int, Equatable {
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
    
    static func > (lhs: HandRanking, rhs: HandRanking) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }
    
    static func < (lhs: HandRanking, rhs: HandRanking) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
