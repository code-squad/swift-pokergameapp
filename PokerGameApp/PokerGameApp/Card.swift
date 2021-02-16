//
//  Card.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/15.
//

import Foundation

class CardDeck {
    
    public var deck = [String]()
    
    public func makeDeck() {
        
        for shape in Card.Shape.allCases {
            
            for num in Card.Num.allCases {
                
                CardDeck().deck.append("\(shape)\(num)")
                
            }
            
        }
        
    }
    
}

struct Card: CustomStringConvertible {
    
    enum Shape: Character, CaseIterable {
        
        case spades = "\u{2664}", clubs = "\u{2667}", diamonds = "\u{2662}", hearts = "\u{2661}"
        
    }
    
    enum Num: String, CaseIterable {
        
        case one = "Ace", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10", eleven = "Jack", twelve = "Queen", thirteen = "King"
        
    }
    
    private var shape: Shape
    private var num: Num
    
    var description: String {
        
        return "(\(shape)\(num))"
        
    }
    
}

extension Card.Num: CustomStringConvertible {
    
    var description: String{
        
        return self.rawValue
        
    }
    
}

extension Card.cardShape: CustomStringConvertible {
    
    var description: String{
        
        return String(self.rawValue)
        
    }
    
}
