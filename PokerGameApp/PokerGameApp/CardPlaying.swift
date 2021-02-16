//
//  CardPlaying.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/16.
//

import Foundation

class CardPlaying: CardDeck {
    
    public static func countDeck() {
        print("Remain cards: \(deck.count)")
    }
    
    public static func shuffleDeck() {
        deck.shuffle()
    }
    
    public static func removeOne() {
        print(deck[0])
        deck.removeFirst()
        CardPlaying.countDeck()
    }
    
    public static func resetDeck() {
        CardDeck.deck.removeAll()
        CardDeck.makeDeck()
        print("Reset deck")
        CardPlaying.countDeck()
    }
    
    
    
}
