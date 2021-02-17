//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/17.
//

import Foundation

class CardDeck {
    private var cards = [Card]()
    
    init() {
        reset()
    }
    
    func countCard() -> Int {
        return cards.count
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func takeOutCard() -> Card {
        return cards.removeFirst()
    }
    
    func reset() {
        Shape.allCases.forEach { (shape) in
            Rank.allCases.forEach { (rank) in
                let card = Card(shape: shape, rank: rank)
                cards.append(card)
            }
        }
    }
}
