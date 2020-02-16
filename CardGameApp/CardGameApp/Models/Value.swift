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
    private var cards_last: [Card] = []
    
    var combinationOf: [HandRanking: [[Card]]] = [:]
    
    mutating func setupValue() {
        var handRankings: [HandRanking] = []
        
        let straight = searchStraight()
        let highestPair = searchPairs()
        
        //        values.append(straight)
        handRankings.append(highestPair)
        
        handRanking = handRankings.sorted(by: >).first!
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
        }
        
        return handRankings.sorted(by: >).first!
    }
    
    private mutating func searchCombinations(of rank: Card.Rank) -> [[Card]] {
        var combinations: [[Card]] = []
        hand.forEach { (card) in
            // 여기서 분리해서 집어 넣으면 되겠다. value인 카드 아닌 카드들 나눠서 ㅇㅇ
            var combination: [Card] = []
            if card.rank == rank {
                combination.append(card)
            }
            combinations.append(combination)
        }
        return combinations
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
}
