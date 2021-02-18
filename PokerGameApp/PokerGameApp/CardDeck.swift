//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/17.
//

struct CardDeck {
    private var cards = [Card]()
    
    mutating func count() -> Int {
        return self.cards.count
    }
}
