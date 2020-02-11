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
    
    func shuffle() {
        
    }
    
    func removeOne() {
        
    }
}
