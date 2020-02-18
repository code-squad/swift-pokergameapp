//
//  CardDeck.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/17.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

struct CardDeck: Equatable {
    private var cards = [Card]()
    
    init() {
        makeCardDeck()
    }
    
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards == rhs.cards
    }
    
    private mutating func makeCardDeck() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card {
        let card = cards.removeLast()
        return card
    }
    
    mutating func reset() {
        cards.removeAll()
        makeCardDeck()
    }
}
