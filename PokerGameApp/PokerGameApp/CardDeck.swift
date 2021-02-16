//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation


struct CardDeck{
    private var currentCardDeck: Array<Card> = []
    
    private func generateCardSet() -> Array<Card> {
        var result: Array<Card> = []
        for suit in Card.Suit.allCases {
            for value in Card.Value.allCases {
                let newCard = Card(suit: suit, value: value)
                result.append(newCard)
            }
        }
        return result
    }
    
    init() {
        currentCardDeck = generateCardSet()
    }
    
    func count() -> Int {
        return currentCardDeck.count
    }
    
    mutating func shuffle() {
        currentCardDeck.shuffle()
    }
    
    mutating func removeOne() -> Card? {
        if let draw = currentCardDeck.popLast() {
            return draw
        } else {
            return nil
        }
    }
    
    mutating func reset() {
        currentCardDeck = generateCardSet()
    }
}
