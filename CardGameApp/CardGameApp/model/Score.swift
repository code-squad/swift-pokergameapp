//
//  Score.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/28.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Score {
    
    enum ScoreWeight: Int {
        case highCard = 0
        case onePair = 1
        case twoPair = 2
        case triple = 3
        case four = 4
        case straight = 5
    }
    
    private var cardDeck: [Card]
    private(set) var highestPairCard: Card?
    private var straightCard: Card?
    private lazy var score = calculateScore()
    
    init(cardDeck : [Card]) {
        self.cardDeck = cardDeck
        sortCard()
    }
    
    public func calculateScore() -> ScoreWeight {
        var pairDeck = [Card : Int]()
        var score: ScoreWeight = .highCard
        if isStraight(cardDeck: cardDeck) {
            return .straight
        }
        pairDeck = judgeDeckPairCount(cardDeck: cardDeck)
        
        let highestPairCount = pairDeck.values.max()
        if highestPairCount == 4 {
            score = .four
        } else if highestPairCount == 3 {
            score = .triple
        } else if highestPairCount == 2 {
            score = checkPairType(cardDeck: pairDeck)
        }
        
        pickHighestPairCard(cardDeck: pairDeck)
        
        return score
    }
    
    private func sortCard() {
        cardDeck.sort { ( first, second) -> Bool in
            first > second
        }
    }
    
    private func judgeDeckPairCount(cardDeck: [Card]) -> [Card : Int] {
        var pairDeckCollection = [Card : Int]()
        
        cardDeck.forEach { (card) in
            pairDeckCollection[card] = cardDeck.filter { $0.rank == card.rank }.count
        }
        
        return pairDeckCollection
    }
    
    private func isStraight(cardDeck: [Card]) -> Bool {
        var straightCount = 1
        var currentCard = cardDeck[0]
        
        for card in cardDeck {
            if currentCard.isContinousRank(nextCard: card) {
                straightCount += 1
                if straightCount == 5 {
                    straightCard = card
                    return true
                }
            } else {
                straightCount = 1
            }
            currentCard = card
        }
        return false
    }
    
    private func checkPairType(cardDeck: [Card : Int]) -> ScoreWeight {
        let pairCount = cardDeck.filter { $0.value == 2 }.count
        
        if pairCount >= 4 {
            return .twoPair
        } else {
            return .onePair
        }
    }
    
    private func pickHighestPairCard(cardDeck: [Card : Int]) {
        let maxValue = cardDeck.values.max()
        let pairDeck = cardDeck.filter { (cardPair) -> Bool in
            return cardPair.value == maxValue
        }
        
        pairDeck.sorted { (first, second) -> Bool in
            first.key > second.key
        }
        
        self.highestPairCard = pairDeck.first!.key
    }
}

extension Score: Equatable {
    static func == (lhs: Score, rhs: Score) -> Bool {
        if lhs.score == .straight && rhs.score == .straight {
            return lhs.straightCard?.rank == rhs.straightCard?.rank
        } else if lhs.score == rhs.score {
            return true
        }
        return false
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        if lhs.score.rawValue < rhs.score.rawValue {
            return true
        }
        return false
    }
}
