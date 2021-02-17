//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/16.
//

import Foundation

struct CardDeck {
    
    private var currentDeck = [Card]()
    
    private var wholeDeck: [Card] {
        var deck = [Card]()
        
        for suit in Card.Suit.allCases {
            deck.append(contentsOf: deckPart(from: suit))
        }
    
        return deck
    }
    
    private func deckPart(from suit: Card.Suit) -> [Card] {
        var cards = [Card]()
        
        for rank in Card.Rank.allCases {
            let card = Card(suit: suit, rank: rank)
            cards.append(card)
        }
        
        return cards
    }
    
    init() {
        currentDeck = wholeDeck
    }
    
    func count() -> Int {
        return currentDeck.count
    }
    
    mutating func shuffle() {
        let lastIdx = count() - 1
        
        for i in 0...lastIdx {
            let currIdx = lastIdx - i
            let randIdx = Int.random(in: 0...currIdx)
            (currentDeck[randIdx], currentDeck[currIdx]) = (currentDeck[currIdx], currentDeck[randIdx])
        }
    }
    
    mutating func removeOne() -> Card? {
        return currentDeck.popLast()
    }
    
    mutating func reset() -> Int {
        currentDeck = wholeDeck
        return count()
    }
}
