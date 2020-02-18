//
//  Score.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/18.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Score {
    enum Scores: Int, Equatable {
        case none = 0
        case onePair
        case twoPair
        case triple
        case fourCard
        case straight
        
        static func >(lhs: Scores, rhs: Scores) -> Bool {
            return lhs.rawValue > rhs.rawValue
        }
    }
    private var cards: [Card]
    private lazy var score = getScore(cards: cards)
    private var straightNumber: Card?
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    private func isStraight(cards: [Card]) -> Bool {
        let sortedCards = cards.sorted { $0 < $1 }
        var currentCard = sortedCards[0]
        var straightCount = 1
        for card in sortedCards {
            if currentCard.isNextCard(with: card) {
                straightCount += 1
                if straightCount == 5 {
                    self.straightNumber = card
                    return true
                }
            } else {
                straightCount = 1
            }
            currentCard = card
        }
        return false
    }
    
    private func checkPairs(info: [Card:Int]) -> Scores {
        let pairCount = info.filter { $0.value == 2 }.count
        
        switch pairCount {
        case 2...:
            return .twoPair
        case 1:
            return .onePair
        default:
            return .none
        }
    }
    
    private func getScore(cards: [Card]) -> Scores {
        let info = cards.reduce(into: [Card:Int]()) {
            if $0[$1] == nil {
                $0[$1] = 1
            } else {
                $0[$1]! += 1
            }
        }
        
        if isStraight(cards: cards) {
            return .straight
        } else if info.contains(where: { $0.value == 4 }) {
            return .fourCard
        } else if info.contains(where: { $0.value == 3 }) {
            return .triple
        }
        return checkPairs(info: info)
    }
}

extension Score: Equatable {
    static func == (lhs: Score, rhs: Score) -> Bool {
        if lhs.score == .straight, rhs.score == .straight {
            return lhs.straightNumber == rhs.straightNumber
        }
        return lhs.score == rhs.score
    }
    
    static func > (lhs: Score, rhs: Score) -> Bool {
        if lhs.score == .straight, rhs.score == .straight {
            return lhs.straightNumber! > rhs.straightNumber!
        }
        return lhs.score > rhs.score
    }
}
