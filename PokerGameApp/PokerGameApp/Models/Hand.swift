//
//  Hand.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/17.
//

import Foundation

class Hand {
    enum Kind: Int {
        case highCard = 0, pair, twoPair, triple, straight, fourOfAKind
    }
    
    private var cards: [Card]
    private(set) var combiCardRank: Set = Set([Rank]())
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func judge() -> Hand.Kind? {
        let orderdHands: [ () -> Hand.Kind?] = [
            fourOfAKind,
            straight,
            triple,
            twoPair,
            pair,
            highCard
        ]
        
        return orderdHands
            .lazy
            .compactMap { fn in return fn() }
            .first
    }
    
    private func highCard() -> Hand.Kind? {
        return cards.max().map { card in
            combiCardRank.insert(card.rank)
            return Hand.Kind.highCard
        }
    }
        
    private func pair() -> Hand.Kind? {
        findRepeated(count: 2).map { rank in
            combiCardRank.insert(rank)
            return Hand.Kind.pair
        }
    }
    
    private func twoPair() -> Hand.Kind? {
        guard let firstPair = findRepeated(count: 2),
              let secondPair = findRepeated(count: 2, notMatching: firstPair) else { return nil }
        
        let (sortedFirst, sortedSecond) = firstPair > secondPair
            ? (firstPair, secondPair)
            : (secondPair, firstPair)
        combiCardRank.insert(sortedFirst)
        combiCardRank.insert(sortedSecond)
        
        return .twoPair
    }
    
    private func triple() -> Hand.Kind? {
        findRepeated(count: 3).map { rank in
            combiCardRank.insert(rank)
            return Hand.Kind.triple
        }
    }
    
    private func fourOfAKind() -> Hand.Kind? {
        findRepeated(count: 4).map { rank in
            combiCardRank.insert(rank)
            return Hand.Kind.fourOfAKind
        }
    }
    
    private func straight() -> Hand.Kind? {
        let sortedCards = cards.map { $0.rank.rawValue }.sorted()
        let pairs = zip(sortedCards, sortedCards.dropFirst())
        let allValuesConsecutive = pairs.allSatisfy { $1 - $0 == 1 }
        if allValuesConsecutive, let maxCard = cards.max() {
            combiCardRank.insert(maxCard.rank)
            return .straight
        }
        
        return nil
    }
    
    private func findRepeated(count repetitionCount:Int, notMatching: Rank? = nil) -> Rank? {
        let counts = computeCounts()
        
        if let (rank, _) = counts.first(where: { (rank, count) in
            return count == repetitionCount && rank != notMatching
        }) {
            return rank
        }
        
        return nil
    }
    
    private func computeCounts() -> [Rank: Int] {
        var counts = [Rank: Int]()
        
        self.cards.forEach { card in
            counts[card.rank] = (counts[card.rank] ?? 0) + 1
        }
        
        return counts
    }
    
    func forEachHand(behavior: (Card) -> ()) {
        cards.forEach { card in
            behavior(card)
        }
    }
}
