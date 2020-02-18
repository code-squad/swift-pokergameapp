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
    private(set) var handRanking: HandRanking = .highCard
    private var restOfHand: [Card] = []
    private var combinationsOf: [HandRanking: [[Card]]] = [:]
    
    init(hand: [Card]) {
        self.hand = hand
        setupHandRanking()
        setupRestOfHand()
    }
    
    mutating func setupHandRanking() {
        var handRankings: [HandRanking] = []
        let highestPair = searchPairs()
        if isStraight() {
            handRankings.append(.straight)
        }
        handRankings.append(highestPair)
        handRanking = handRankings.sorted(by: >).first!
    }
    
    mutating func setupRestOfHand() {
        hand.forEach { (cardOfHand) in
            combinationsOf[handRanking]!.forEach { (combination) in
                combination.forEach { (combiCard) in
                    if cardOfHand != combiCard { restOfHand.append(cardOfHand) }
                }
            }
        }
        restOfHand.sort(by: <)
    }
    
    private mutating func isStraight() -> Bool {
        let NUMBER_OF_STRAIGHT_CARDS = 5
        let sortedHand = hand.sorted{ $0.rank < $1.rank }
        var combinations: [[Card]] = []
        var isCombiStraights: [Bool] = []
        
        for startIndex in 0...hand.count - NUMBER_OF_STRAIGHT_CARDS {
            var isThisCombiStraight = true
            
            let combination = Array(sortedHand[startIndex..<startIndex + NUMBER_OF_STRAIGHT_CARDS])
            for i in 0..<NUMBER_OF_STRAIGHT_CARDS - 1 {
                if !(sortedHand[startIndex + i].isNext(to: sortedHand[startIndex + i + 1])) {
                    isThisCombiStraight = false
                }
            }
            if isThisCombiStraight { combinations.append(combination) }
            isCombiStraights.append(isThisCombiStraight)
        }
        combinationsOf[.straight] = combinations
        for isStraight in isCombiStraights {
            if isStraight { return true }
        }
        return false
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
            var combinations: [[Card]] = combinationsOf[handRanking] ?? [[Card]]()
            let combination = searchCombinations(of: rank)
            combinations.append(combination)
            combinationsOf[handRanking] = combinations
        }
        
        var onePairCount = 0
        handRankings.forEach {
            if $0 == .onePair { onePairCount += 1 }
        }
        if onePairCount >= 2 {
            handRankings.append(.twoPairs)
            var onePairs = combinationsOf[.onePair]!
            onePairs.sort(by: { $0.first! > $1.first! })
            if onePairs.count > 2 { onePairs.removeLast() }
            combinationsOf[.twoPairs] = onePairs
        }
        
        return handRankings.sorted(by: >).first!
    }
    
    private mutating func searchCombinations(of rank: Card.Rank) -> [Card] {
        var combination: [Card] = []
        hand.forEach { (card) in
            if card.rank == rank {
                combination.append(card)
            }
        }
        return combination
    }
}

extension Value: Equatable {
    static func == (lhs: Value, rhs: Value) -> Bool {
        let sortedLhs = lhs.hand.map{ $0.rank }.sorted(by: <)
        let sortedRhs = rhs.hand.map{ $0.rank }.sorted(by: <)
        return sortedLhs == sortedRhs
    }
    
    static func > (lhs: Value, rhs: Value) -> Bool {
        let lhsRanks = lhs.restOfHand.map{ $0.rank }
        let rhsRanks = rhs.restOfHand.map{ $0.rank }
        
        if lhs.handRanking == rhs.handRanking {
            let lhsCombinationsRepresentationRanks = lhs.combinationsOf[lhs.handRanking]!.map({ $0.first!.rank }).sorted(by: >)
            let rhsCombinationsRepresentationRanks = rhs.combinationsOf[rhs.handRanking]!.map({ $0.first!.rank }).sorted(by: >)
            
            for index in 0..<lhsCombinationsRepresentationRanks.count {
                if lhsCombinationsRepresentationRanks[index] >  rhsCombinationsRepresentationRanks[index] { return true }
            }
            
            for index in 0..<lhs.restOfHand.count {
                if lhsRanks[index] > rhsRanks[index] { return true }
            }
            return false
        } else {
            return lhs.handRanking > rhs.handRanking
        }
    }
    
    static func < (lhs: Value, rhs: Value) -> Bool {
        let lhsRanks = lhs.restOfHand.map{ $0.rank }
        let rhsRanks = rhs.restOfHand.map{ $0.rank }
        
        if lhs.handRanking == rhs.handRanking {
            let lhsCombinationsRepresentationRanks = lhs.combinationsOf[lhs.handRanking]!.map({ $0.first!.rank }).sorted(by: >)
            let rhsCombinationsRepresentationRanks = rhs.combinationsOf[rhs.handRanking]!.map({ $0.first!.rank }).sorted(by: >)
            
            for index in 0..<lhsCombinationsRepresentationRanks.count {
                if lhsCombinationsRepresentationRanks[index] <  rhsCombinationsRepresentationRanks[index] { return true }
            }
            
            for index in 0..<lhs.restOfHand.count {
                if lhsRanks[index] < rhsRanks[index] { return true }
            }
            return false
        } else {
            return lhs.handRanking < rhs.handRanking
        }
    }
}

enum HandRanking: Int, Comparable {
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
