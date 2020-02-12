//
//  CardDeck.swift
//  CardGameApp
//
//  Created by JW on 2020/02/10.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

struct CardDeck {
    var cards: [Card]!
    var count: Int {
        return cards.count
    }
    
    init() {
        cards = [Card]()
        createCardDeck()
        shuffle()
    }
    
    mutating func createCardDeck() {
        let maxRank = Card.Rank.thirteen.rawValue
        let suitArray = [Card.Suit.clubs.rawValue, Card.Suit.spades.rawValue, Card.Suit.hearts.rawValue, Card.Suit.diamonds.rawValue]
        for count in 1...maxRank {
            for suit in suitArray {
                cards.append(Card(suit: Card.Suit(rawValue: suit)!, rank: Card.Rank(rawValue: count)!))
            }
        }
    }
    
    func reset() {
        
    }
    
    mutating func shuffle() {
        for i in 0..<cards.count - 1 {
            let randomIndex = Int.random(in: i..<cards.count)
            let temp = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
    
    mutating func removeOne() -> Card? {
        guard cards.count > 0 else { return nil }
        let pickedCardIndex = Int.random(in: 0..<cards.count)
        cards.remove(at: pickedCardIndex)
        return cards[pickedCardIndex]
    }
}
