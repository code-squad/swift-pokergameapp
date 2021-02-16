//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/15.
//

import Foundation

struct CardDeck {
    private var cards : [Card] = []
    
    init() {
        makeCard()
    }
    private mutating func makeCard() {
        Suit.allCases.forEach { suit in
            Rank.allCases.forEach { rank in
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        return cards.shuffle()
    }
    
    mutating func removeOne() -> Card? {
        return cards.popLast()
    }
    
    mutating func reset() {
        cards.removeAll()
        makeCard()
    }
    
}
