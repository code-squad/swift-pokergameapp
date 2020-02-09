//
//  Deck.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/07.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

struct Deck {
    private var cards = [Card]()
    var count: Int {
        cards.count
    }
    
    init() {
        reset()
    }
    
    mutating func reset() {
        cards = [Card]()
        Card.Shape.allCases.forEach {
            let shape = $0
            Card.Rank.allCases.forEach {
                cards.append(Card(shape: shape, rank: $0))
            }
        }
    }
    
    mutating func removeOne() -> Card? {
        guard count > 0 else {
            return nil
        }
        let card = cards.removeLast()
        return card
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}

extension Deck: Equatable {
    static func == (lhs: Deck, rhs: Deck) -> Bool {
        for index in 0..<lhs.count {
            if lhs.cards[index] != rhs.cards[index] {
                return false
            }
        }
        return true
    }
}
