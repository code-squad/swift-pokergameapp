//
//  CardPlaying.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/16.
//

import Foundation

class CardPlaying {
    
    public var deck = [String]()
    
    public func makeDeck() {
        
        for shape in Card.Shape.allCases {
            
            for num in Card.Num.allCases {
                
                deck.append("\(shape)\(num)")
                
            }
            
        }
        
    }
    
    public func countDeck() {
        
        print("Remain cards: \(deck.count)")
        
    }
    
    public func shuffleDeck() {
        
        deck.shuffle()
        
    }
    
    public func removeOne() {
        
        print(deck[0])
        deck.removeFirst()
        self.countDeck()
        
    }
    
    public func resetDeck() {
        
        deck.removeAll()
        makeDeck()
        print("Reset deck")
        self.countDeck()
        
    }

}

