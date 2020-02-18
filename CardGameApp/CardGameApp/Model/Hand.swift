//
//  Hand.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/12.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Hand {
    enum Score: Int, Equatable {
        case none = 0
        case onePair
        case twoPair
        case triple
        case fourCard
        case straight
        
        static func >(lhs: Score, rhs: Score) -> Bool {
            return lhs.rawValue > rhs.rawValue
        }
    }
    private var cards = [Card]()
    private lazy var score = getScore()
    private lazy var ranks = Ranks(cards: cards)
    
    func forEach(_ transform: (Card) -> ()) {
        cards.forEach(transform)
    }
    
    func add(card: Card) {
        cards.append(card)
    }
    
    private func isStraight() -> Bool {
        let sortedCards = cards.sorted { $0 < $1 }
        var currentCard = sortedCards[0]
        var straightCount = 1
        for card in sortedCards {
            if currentCard.isNextCard(with: card) {
                straightCount += 1
                if straightCount == 5 {
                    return true
                }
            } else {
                straightCount = 1
            }
            currentCard = card
        }
        return false
    }
    
    private func checkPairs(info: [Card:Int]) -> Score {
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
    
    private func getScore() -> Score {
        let info = cards.reduce(into: [Card:Int]()) {
            if $0[$1] == nil {
                $0[$1] = 1
            } else {
                $0[$1]! += 1
            }
        }
        
        if isStraight() {
            return .straight
        } else if info.contains(where: { $0.value == 4 }) {
            return .fourCard
        } else if info.contains(where: { $0.value == 3 }) {
            return .triple
        }
        return checkPairs(info: info)
    }
}

extension Hand: Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        lhs.score == rhs.score && lhs.ranks == rhs.ranks
    }
    
    static func > (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.score == rhs.score {
            return lhs.ranks > rhs.ranks
        }
        return lhs.score > rhs.score
    }
}
