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

enum Score {
    case fourOfAKind(highestCard: Card)
    case straight(highestCard: Card)
    case threeOfAKind(highestCard: Card)
    case twoPairs(highestCard: Card)
    case pair(highestCard: Card)
    case highcard(highestCard: Card)
    case none
    
    var priority: Int {
        switch self {
        case .fourOfAKind: return 1
        case .straight: return 2
        case .threeOfAKind: return 3
        case .twoPairs: return 4
        case .pair: return 5
        case .highcard: return 6
        case .none: return 7
        }
    }
}

extension Score: Comparable {
    static func < (lhs: Score, rhs: Score) -> Bool {
        return lhs.priority > rhs.priority
    }
}
