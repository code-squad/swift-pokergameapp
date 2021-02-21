//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/18.
//

import Foundation

class CardDeck {
    
    private var deck = [Card]()
    
    public func make() {
        for shape in Card.Shape.allCases {
            for num in Card.Num.allCases {
                deck.append(Card(shape: shape, num: num))
            }
        }
    }
    
    public func shuffle() {
        deck.shuffle()
    }
    
    public func selectedCard() -> Card {
        return deck[0]
    }
    
    public func removeSelectedCard() {
        deck.removeFirst()
    }
    
    public func reset() {
        deck.removeAll()
    }
    
}
