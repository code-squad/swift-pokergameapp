//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/16.
//

import Foundation

struct CardDeck {
    var cards: [Card] = []
    init() {
        for i in 1...13 {
            cards.append(Card(Card.Nums(rawValue: i)!, Card.Shapes.clobers))
            cards.append(Card(Card.Nums(rawValue: i)!, Card.Shapes.diamonds))
            cards.append(Card(Card.Nums(rawValue: i)!, Card.Shapes.hearts))
            cards.append(Card(Card.Nums(rawValue: i)!, Card.Shapes.spades))
        }
    }
    func count() -> Int {
        return cards.count
    }
}
