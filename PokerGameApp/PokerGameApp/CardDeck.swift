//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

struct CardDeck {
    private var cards: [Card]
    private var total: Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    mutating func reset(with cards: [Card]) {
        self.cards = cards
    }
    
    mutating func shuffle() -> [Card] {
        var swappedIndexes: [Int] = []
        var shuffledCards = cards
        
        func swapCardWithRandomFollowingCard(index: Int) {
            let randomIndex = index +
                Int(arc4random_uniform(UInt32(total - index)))
            shuffledCards.swapAt(index, randomIndex)
            swappedIndexes.append(randomIndex)
        }
        
        for index in 0..<total {
            let cardWasNotSwappedYet = !swappedIndexes.contains(index)
            guard cardWasNotSwappedYet else {
                continue
            }
            swapCardWithRandomFollowingCard(index: index)
        }
        
        return shuffledCards
    }
}

struct CardDeckGenerator {
    static func generateCardDeck() -> [Card] {
        var cards: [Card] = []
        
        for suit in Card.Suit.allCases {
            for rank in Rank.allCases {
                cards.append(Card(rank: rank, suit: suit))
            }
        }
        
        return cards
    }
}
