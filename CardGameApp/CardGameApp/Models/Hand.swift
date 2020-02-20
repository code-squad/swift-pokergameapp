//
//  Hand.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

struct Hand {
    private(set) var cards: [Card] = []
    private(set) var handRanking: HandRanking = .highCard
    private var combinationsOf: [HandRanking: [[Card]]] = [:]
    private var restOfHand: [Card] = []
    
    init(cards: [Card] = []) {
        self.cards = cards
    }
    
    mutating func appendCard(_ card: Card) {
        cards.append(card)
    }
    
    mutating func calculate() {
        setupHandRanking()
        setupRestOfHand()
        print(self)
    }
    
    mutating func setupHandRanking() {
        searchPairs()
        searchStraight()
    }
    
    mutating func setupRestOfHand() {
        var restOfHandSet: Set<Card> = Set(cards)
        guard let combinations = combinationsOf[handRanking] else { return }
        combinations.forEach { (cards) in
            cards.forEach{ restOfHandSet.remove($0) }
        }
        restOfHand = Array(restOfHandSet).sorted(by: >)
    }
    
    private mutating func searchStraight() {
        guard handRanking < .straight else { return }
        let NUMBER_OF_STRAIGHT_CARDS = 5
        let sortedHand = cards.sorted{ $0.rank < $1.rank }
        var combinations: [[Card]] = []
        var isCombiStraights: [Bool] = []
        
        for startIndex in 0...cards.count - NUMBER_OF_STRAIGHT_CARDS {
            var isThisCombiStraight = true
            
            let combination = Array(sortedHand[startIndex..<startIndex + NUMBER_OF_STRAIGHT_CARDS])
            for i in 0..<NUMBER_OF_STRAIGHT_CARDS - 1 {
                if !(sortedHand[startIndex + i].isNext(to: sortedHand[startIndex + i + 1])) {
                    isThisCombiStraight = false
                }
            }
            
            if isThisCombiStraight {
                combinations.append(combination)
                combinationsOf[.straight] = combinations
            }
            isCombiStraights.append(isThisCombiStraight)
        }
        isCombiStraights.forEach{ if $0 { handRanking = .straight } }
    }
    
    private mutating func searchPairs() {
        var rankCountDict: [Card.Rank: Int] = [:]
        cards.forEach{ rankCountDict[$0.rank] = (rankCountDict[$0.rank] ?? 0) + 1 }
        
        var onePairCount = 0
        rankCountDict.forEach { (rank, count) in
            let currentHandRanking = HandRanking(count: count)
            if count == 2 { onePairCount += 1 }
            setCombinations(for: rank, for: currentHandRanking)
            guard currentHandRanking > handRanking else { return }
            handRanking = currentHandRanking
        }
        
        if onePairCount >= 2 {
            guard handRanking < .twoPairs else { return }
            handRanking = .twoPairs
            
            var onePairs = combinationsOf[.onePair]!
            onePairs.sort(by: { $0.first! > $1.first! })
            if onePairs.count > 2 { onePairs.removeLast() }
            combinationsOf[.twoPairs] = onePairs
        }
    }
    
    private mutating func setCombinations(for rank: Card.Rank, for handRanking: HandRanking) {
        var combinations: [[Card]] = combinationsOf[handRanking] ?? [[Card]]()
        var combination: [Card] = []
        cards.forEach { (card) in
            if card.rank == rank {
                combination.append(card)
            }
        }
        combinations.append(combination)
        combinationsOf[handRanking] = combinations
    }
    
    func forEachCard(_ handler: (Card) -> ()) {
        cards.forEach{ handler($0) }
    }
}

extension Hand: Comparable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        let sortedLhs = lhs.cards.map{ $0.rank }.sorted(by: <)
        let sortedRhs = rhs.cards.map{ $0.rank }.sorted(by: <)
        return sortedLhs == sortedRhs
    }
    
    static func > (lhs: Hand, rhs: Hand) -> Bool {
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
    
    static func < (lhs: Hand, rhs: Hand) -> Bool {
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
