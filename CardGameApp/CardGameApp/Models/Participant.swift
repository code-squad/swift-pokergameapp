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
    
    func take(card: Card) {
        hand.add(card: card)
    }
    
    @discardableResult
    func repeatForEachCard<T>(_ transform: (Card) -> T) -> [T] {
        return hand.repeatForEachCard { transform($0) }
    }
}

extension Participant: Equatable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.hand == rhs.hand
    }
}

extension Participant {
    func score() -> Score {
        let (isContinuous, highestCard) = hand.isContinuous(for: 5)
        if isContinuous, let card = highestCard {
            return .straight(highestCard: card)
        }
        
        var overlappedCard = hand.overlapDuplicates()
        guard let (card, count) = overlappedCard.popFirst() else { return .none }
        
        switch count {
        case 4...: return .fourOfAKind(highestCard: card)
        case 3: return .threeOfAKind(highestCard: card)
        case 1: return .highcard(highestCard: card)
        default: break
        }
        
        if count == 2, let (_, secondCardCount) = overlappedCard.popFirst() {
            if secondCardCount == 2 { return .twoPairs(highestCard: card) }
            return .highcard(highestCard: card)
        }
        return .none
    }
}

extension BidirectionalCollection {
    mutating func popFirst() -> Self.Element? {
        guard let firstElement = self.first else { return nil }
        return firstElement
    }
}
