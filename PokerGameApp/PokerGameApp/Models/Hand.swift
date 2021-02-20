//
//  Hand.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/17.
//

import Foundation

struct Hand {
    private let cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func getHand() -> [Card] {
        return self.cards
    }
}
