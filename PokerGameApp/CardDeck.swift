//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/18.
//

import Foundation

class CardDeck {
    
    public var deck = [String]()
    
    public func make() {
        for shape in Card.Shape.allCases {
            for num in Card.Num.allCases {
                deck.append("\(shape)\(num)")
            }
        }
    }
    
    public func count() {
        let deckCount = deck.count
        print("Remain cards: \(deckCount)")
    }
    
    public func shuffle() {
        deck.shuffle()
    }
    
    public func removeOne() {
        let selectedCard = deck[0]
        print(selectedCard)
        deck.removeFirst()
        self.count()
    }
    
    public func reset() {
        deck.removeAll()
        make()
        print("Reset deck")
        self.count()
    }
    
}
