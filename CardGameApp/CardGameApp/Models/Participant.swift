//
//  Participant.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/18.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Participant {
    private var hand = Hand()
    private var isWinner = false
    
    func take(card: Card) {
        hand.add(card: card)
    }
    
    @discardableResult
    func repeatForEachCard<T>(_ transform: (Card) -> T) -> [T] {
        return hand.repeatForEachCard { transform($0) }
    }
    
    func markIfWinner(_ block: () -> Bool) {
        isWinner = block()
    }
    
    func informWinner(_ block: (Bool) -> ()) {
        block(isWinner)
    }
}

extension Participant: Equatable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.hand == rhs.hand
    }
}

extension Participant {
    func score() -> Score {
        let (isContinuous, highestCard) = highestCardIfHandisStraight()
        if isContinuous, let card = highestCard {
            return .straight(highestCard: card)
        }
        
        var overlappedCard = hand.overlapDuplicates()
        guard let (card, count) = overlappedCard.popFirst() else { return .none }
        
        switch count {
        case 4...: return .fourOfAKind(highestCard: card)
        case 3: return .threeOfAKind(highestCard: card)
        case 2: return determineHowManyPairs(with: overlappedCard.popFirst(), highestCard: card)
        case 1: return .highcard(highestCard: card)
        default: return .none
        }
    }
    
    private func highestCardIfHandisStraight() -> (Bool, Card?) {
        let straightCountOfTexasHoldem = 5
        return hand.isContinuous(for: straightCountOfTexasHoldem)
    }
    
    private func determineHowManyPairs(with overlappedCard: (Card, Int)?, highestCard: Card) -> Score {
        if let (_, count) = overlappedCard, count == 2 {
            return .twoPairs(highestCard: highestCard)
        }
        return .pair(highestCard: highestCard)
    }
}

extension Array {
    mutating func popFirst() -> Self.Element? {
        guard let _ = self.first else { return nil }
        return self.removeFirst()
    }
}
