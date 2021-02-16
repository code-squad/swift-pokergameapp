//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

struct CardDeck {
    private var cards = [Card]()
    
    init() {
        cards = CardDeckGenerator.generateCardDeck()
    }
    
    mutating func shuffle() -> [Card] {
        var swappedIndexes: [Int] = []
        var shuffledCards = cards
        
        func swapCardWithRandomFollowingCard(index: Int) {
            let randomIndex = index +
                Int(arc4random_uniform(UInt32(count() - index)))
            shuffledCards.swapAt(index, randomIndex)
            swappedIndexes.append(randomIndex)
        }
        
        for index in 0..<count() {
            let cardWasNotSwappedYet = !swappedIndexes.contains(index)
            guard cardWasNotSwappedYet else {
                continue
            }
            swapCardWithRandomFollowingCard(index: index)
        }
        
        return shuffledCards
    }
    
    mutating func removeOne() -> Card? {
        guard let cardToRemoved = cards.popLast() else { return nil }
        return cardToRemoved
    }
    
    mutating func count() -> Int {
        return cards.count
    }
}

extension CardDeck: Equatable {
    static func ==(lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards == rhs.cards
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
