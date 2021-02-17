//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/16.
//

import Foundation

struct CardDeck {
    private var cards: [Card] = []
    
    mutating func makeCardDeck()  {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    mutating func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card? {
        return cards.removeLast()
    }
    
    mutating func reset() {
        cards.removeAll()
        makeCardDeck()
    }
}
