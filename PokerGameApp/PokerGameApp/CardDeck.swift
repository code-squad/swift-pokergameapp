//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation


class CardDeck{
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
    
    public func count() -> Int {
        return currentCardDeck.count
    }
    
    public func shuffle() {
        currentCardDeck.shuffle()
    }
    
    public func removeOne() -> Card? {
        if let draw = currentCardDeck.popLast() {
            return draw
        } else {
            return nil
        }
    }

    public func reset() {
        currentCardDeck = generateCardSet()
    }
}
