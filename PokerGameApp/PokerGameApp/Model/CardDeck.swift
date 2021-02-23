//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/16.
//

import Foundation

struct CardDeck {
    
    private var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    mutating func filltheCardDeck() {
        Card.Rank.allCases.forEach { (rank) in
            Card.Suit.allCases.forEach { (suit) in
                cards.append(Card(suit: suit, rank: rank, cardImage: "\(rank)+\(suit)"))
            }
        }
    }
    func printcards() {
        print(cards)
    }
    
    func countOfCards() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card {
        let drawnCard = cards.removeFirst()
        return drawnCard
    }
    
    mutating func reset() {
        cards.removeAll()
        filltheCardDeck()
    }
    
    mutating func give(gameType: GameType) -> [Card] {
        var givingCards = [Card]()
        for _ in 0..<gameType.rawValue {
            givingCards.append(self.removeOne())
        }
        return givingCards
    }
}
