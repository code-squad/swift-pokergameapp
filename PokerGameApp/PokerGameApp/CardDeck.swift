//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/16.
//

import Foundation

struct CardDeck {
    
    private var cards: [Card] = []
    
    init() {
        cards = Card.Suit.allCases.flatMap { getAllCards(for: $0) }
    }
    
    private func getAllCards(for symbol: Card.Suit) -> [Card] {
        return Card.Rank.allCases.map { Card(suit: symbol, rank: $0) }
    }
}
