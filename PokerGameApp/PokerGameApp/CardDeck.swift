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
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card? {
        let numberOfCards = count()
        if numberOfCards == 0 {
            return nil
        } else {
            let randomNumber = Int.random(in: 0..<numberOfCards)
            return cards.remove(at: randomNumber)
        }
    }
    
    mutating func reset() {
        cards = Card.Suit.allCases.flatMap { getAllCards(for: $0) }
    }
    
    private func getAllCards(for symbol: Card.Suit) -> [Card] {
        return Card.Rank.allCases.map { Card(suit: symbol, rank: $0) }
    }
}
