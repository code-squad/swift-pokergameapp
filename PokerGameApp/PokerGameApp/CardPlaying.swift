//
//  CardPlaying.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/16.
//

import Foundation

class CardPlaying {
    
    let cardDeck = CardDeck()
    
    public func countDeck() {
        print("Remain cards: \(cardDeck.deck.count)")
    }
    
    public func shuffleDeck() {
        cardDeck.deck.shuffle()
    }
    
    public func removeOne() {
        print(CardDeck().deck[0])
        cardDeck.deck.removeFirst()
        self.countDeck()
    }
    
    public func resetDeck() {
        cardDeck.deck.removeAll()
        cardDeck.makeDeck()
        print("Reset deck")
        self.countDeck()
    }

}
