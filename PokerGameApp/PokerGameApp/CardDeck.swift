//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/16.
//

import Foundation

struct CardDeck {
    var cards: [Card] = []
    
    init() {
        reset()
    }

    var count: Int {
        get { return self.cards.count }
    }
    
    mutating func shuffle() {
        for i in 0..<self.cards.count-1 {
            let randomIndex = Int.random(in: 1..<self.cards.count)
            let temp = self.cards[i]
            
            self.cards[i] = self.cards[randomIndex]
            self.cards[randomIndex] = temp
        }
    }
    
    mutating func removeOn() -> Card?{
        return cards.count == 0 ? nil : self.cards.popLast()
    }
    
    mutating func reset() {
        self.cards.removeAll()
        
        Card.Nums.allCases.map{ num in
            Card.Shapes.allCases.map{ shape in
                self.cards.append(Card(num, shape))} }
    }
}
