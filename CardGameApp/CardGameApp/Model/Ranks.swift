//
//  Ranks.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/18.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Ranks {
    private var sortedCards: [Card]
    
    init(cards: [Card]) {
        let info = cards.reduce(into: [Card:Int]()) {
            if $0[$1] == nil {
                $0[$1] = 1
            } else {
                $0[$1]! += 1
            }
        }
        let result = info.sorted { (lhs, rhs) -> Bool in
            if lhs.value == rhs.value {
                return lhs.key > rhs.key
            } else {
                return lhs.value > rhs.value
            }
        }
        self.sortedCards = result.map { (value) -> Card in value.key }
    }
}

extension Ranks: Equatable {
    static func == (lhs: Ranks, rhs: Ranks) -> Bool {
        lhs.sortedCards == rhs.sortedCards
    }
    
    static func > (lhs: Ranks, rhs: Ranks) -> Bool {
        for index in 0...lhs.sortedCards.count {
            if lhs.sortedCards[index] == rhs.sortedCards[index] {
                continue
            } else {
                return lhs.sortedCards[index] > rhs.sortedCards[index]
            }
        }
        return false
    }
}
