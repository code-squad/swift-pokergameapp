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
        reset()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        // cards.shuffle() 대신 셔플 직접 구현
        /// Fisher–Yates shuffle의 Durstenfeld's version 참고
        var swappedIndex: Int = cards.count - 1
        
        while swappedIndex != 0 {
            let randomIndex = Int.random(in: 0...swappedIndex)
            let lastCard = cards[swappedIndex]
            cards[swappedIndex] = cards[randomIndex]
            cards[randomIndex] = lastCard
            swappedIndex -= 1
        }
    }
    
    mutating func removeOne() -> Card? {
        if let lastCard = cards.popLast() { return lastCard }
        return nil
    }
    
    mutating func reset() {
        cards = Card.Suit.allCases.flatMap { suit in
            Card.Rank.allCases.map { rank in
                Card(suit: suit, rank: rank)
            }
        }
    }
}
