//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/16.
//

import Foundation

struct CardDeck {
    
    var currentDeck = [Card]()
    
    private var wholeDeck: [Card] {
        var deck = [Card]()
        
        for suit in Card.Suit.allCases {
            deck.append(contentsOf: deckPart(from: suit))
        }
    
        return deck
    }
    
    init() { reset() }
    
    func count() -> Int { return currentDeck.count }
    
    mutating func shuffle() {
        //modern fisher-yates shuffle
        let lastIndex = currentDeck.count - 1
        
        for i in 0...lastIndex {
            let currentIndex = lastIndex - i
            let randomIndex = Int.random(in: 0...currentIndex)
            let temp = currentDeck[randomIndex]
            currentDeck[randomIndex] = currentDeck[currentIndex]
            currentDeck[currentIndex] = temp
        }
    }
    
    mutating func removeOne() -> Card? {
        return currentDeck.popLast()
    }
    
    mutating func reset() {
        currentDeck = wholeDeck
        shuffle()
    }
    
    private func deckPart(from suit: Card.Suit) -> [Card] {
        var cards = [Card]()
        
        for rank in Card.Rank.allCases {
            let card = Card(suit: suit, rank: rank)
            cards.append(card)
        }
        
        return cards
    }
}
