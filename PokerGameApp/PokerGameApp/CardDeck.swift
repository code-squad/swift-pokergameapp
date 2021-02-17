//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/16.
//

import Foundation

struct CardDeck {
    private var deck: [Card] = []
    
    init() {
        setCardDeck()
    }
    
    private mutating func setCardDeck() {
        Suit.allCases.forEach { suit in
            Rank.allCases.forEach { rank in
                deck.append(Card(rank: rank, suit: suit))
            }
        }
    }
    
    func count() -> Int {
        return deck.count
    }
    
    mutating func shuffle() {
        deck.shuffle()
    }
    
    mutating func removeOne() -> Card? {
        return deck.popLast()
    }
    
    mutating func reset() {
        deck.removeAll()
        setCardDeck()
    }
    
}
