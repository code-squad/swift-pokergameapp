//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/16.
//

import Foundation

struct CardDeck {
    
    var cards: [Card] = []
    
    mutating func filltheCardDeck() {
        Card.Rank.allCases.forEach { (rank) in
            Card.Suit.allCases.forEach { (suit) in
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func printCountOfCards() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func removeOne() {
        cards.remove(at: Int(arc4random_uniform(UInt32(cards.count))))
    }
    
    mutating func reset() {
        cards.removeAll()
        filltheCardDeck()
    }
}
