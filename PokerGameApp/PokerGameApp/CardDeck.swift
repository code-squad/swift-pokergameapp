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
    
    func empty() -> Bool {
        return cards.isEmpty
    }
    
    mutating func shuffle() {
        for index in cards.enumerated() {
            let radomIndex = Int.random(in: index.offset..<cards.count)
            let temp = cards[index.offset]
            cards[index.offset] = cards[radomIndex]
            cards[radomIndex] = temp
        }
    }
    
    mutating func removeOne() -> Card? {
        return cards.popLast()
    }
    
    mutating func reset() {
        cards.removeAll()
        makeCard()
    }
    
}
