//
//  Deck.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/11.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct Deck {
    private var cards : [Card]!
    
    var count : Int {
        return cards.count
    }
    
    init() {
        self.cards = initCards()
    }
    
    private func initCards() -> [Card] {
        var cards = [Card]()
        for suit in Card.Suit.allCases {
            for number in Card.Number.allCases {
                cards.append(Card(
                    suit: suit,
                    number: number))
            }
        }
        return cards
    }
}
