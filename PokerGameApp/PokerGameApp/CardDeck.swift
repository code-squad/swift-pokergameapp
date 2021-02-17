//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/16.
//

import Foundation

struct CardDeck {
    private var cards = [Card]()
    var count: Int {
        return cards.count
    }
    
    init() {
        reset()
    }
    
    mutating func shuffle() {
        for i in 0..<cards.count - 1 {
            let randomIndex = Int.random(in: i..<cards.count)
            let temp = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
    
    mutating func removeOne() -> Card? {
        return cards.popLast()
    }
    
    mutating func reset() {
        cards = []
        Card.Shape.allCases.forEach { shape in
            Card.Number.allCases.forEach { number in
                cards.append(Card(shape: shape, number: number))
            }
        }
    }
}
