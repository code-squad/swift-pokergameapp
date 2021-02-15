//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/15.
//

import Foundation

struct CardDeck {
    var cards : [Card]
    
    func getCount() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        return cards.shuffle()
    }
    
    mutating func randomCard() {
        cards.popLast()
    }
    
    mutating func reset() {
        cards.removeAll()
    }
    
}
