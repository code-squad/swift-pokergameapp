//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

struct CardDeck {
    private var cards: [Card]
    private var total: Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
}
