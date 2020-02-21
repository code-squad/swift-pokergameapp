//
//  Hand.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/18.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Hand {
    private var cards = [Card]()
    
    func add(card: Card) {
        cards.append(card)
    }
    
    @discardableResult
    func repeatForEachCard<T>(_ transform: (Card) -> (T)) -> [T] {
        return cards.map { transform($0) }
    }
}

extension Hand: Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.cards == rhs.cards
    }
}

extension Hand {
    func isContinuous(for number: Int) -> (Bool, Card?) {
        let sortedCardSet = Set(cards).sorted(by: >)
        var continuity = 1
        var highestCard = sortedCardSet.first
        var previousCard: Card? = nil
        
        sortedCardSet.forEach { card in
            if let previousCard = previousCard,
                previousCard.isNext(to: card) {
                continuity += 1
            } else {
                highestCard = card
                continuity = 1
            }
            previousCard = card
        }
        
        if continuity >= number {
            return (true, highestCard)
        }
        return (false, nil)
    }
    
    func overlapDuplicates() -> [(Card, Int)] {
        let label = zip(cards, (0..<cards.count).map { _ in 1 })
        return Dictionary().merging(label, uniquingKeysWith: +).sorted {
            if $0.value == $1.value {
                return $0 > $1
            }
            return $0.value > $1.value
        }
    }
}
