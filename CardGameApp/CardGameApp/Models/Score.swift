//
//  Score.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/20.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

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
    
    var highestCard: Card? {
        switch self {
        case let .fourOfAKind(highestCard: card),
             let .straight(highestCard: card),
             let .threeOfAKind(highestCard: card),
             let .twoPairs(highestCard: card),
             let .pair(highestCard: card),
             let .highcard(highestCard: card):
            return card
        default: return nil
        }
    }
    
    func isSamePriority(with score: Score) -> Bool {
        return priority == score.priority
    }
    
    func isSame(with score: Score, card: Card) -> Bool {
        return self.isSamePriority(with: score) && self.highestCard == card
    }
}

extension Score: Comparable {
    static func < (lhs: Score, rhs: Score) -> Bool {
        return lhs.priority > rhs.priority
    }
}
