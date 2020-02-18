//
//  CardDeck.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/17.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

struct CardDeck: Equatable {
    private var cardDeck: [Card]
    
    init() {
        cardDeck = [Card]()
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cardDeck.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cardDeck == rhs.cardDeck
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
