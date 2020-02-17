//
//  CardDeck.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/17.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cardDeck = [Card]()
    
    init() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cardDeck.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func count() -> Int {
        return cardDeck.count
    }
    
    mutating func shuffle() {
        cardDeck.shuffle()
    }
    
    mutating func removeOne() -> Card {
        let index = Int.random(in: 0..<cardDeck.count)
        let card = cardDeck.remove(at: index)
        return card
    }
    
    mutating func reset() {
        cardDeck = CardDeck().cardDeck
    }
}
