//
//  Player.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Player {
    private var hand = Hand()
    var score: Hand.Score {
        hand.getScore()
    }
    var numbers: [Int] {
        hand.getNumbers()
    }
    
    func forEachCard(_ transform: (Card) -> ()) {
        hand.forEach(transform)
    }
    
    func discard() {
        hand = Hand()
    }
    
    func receive(_ card: Card) {
        hand.add(card: card)
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.score == rhs.score
    }
    
    static func > (lhs: Player, rhs: Player) -> Bool {
        if lhs == rhs {
            for index in 0..<lhs.numbers.count {
                if lhs.numbers[index] == rhs.numbers[index] {
                    continue
                } else {
                    return lhs.numbers[index] > rhs.numbers[index]
                }
            }
        }
        return lhs.score > rhs.score
    }
}
