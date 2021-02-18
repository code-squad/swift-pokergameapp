//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/17.
//

import Foundation

struct CardDeck {
    private var cardDeck: [Card]

    init(empty: Bool) {
        cardDeck = []
        empty == true ? nil : reset()
    }
    
    public var count: Int {
        return cardDeck.count
    }
    
    //Knuth Shuffle 알고리즘
    public mutating func shuffle() {
        for index in 0..<cardDeck.count-1 {
            let randomIndex = Int.random(in: index..<cardDeck.count)
            let tempCard = cardDeck[index]
            cardDeck[index] = cardDeck[randomIndex]
            cardDeck[randomIndex] = tempCard
        }
    }
    
    public mutating func popCard() -> Card? {
        return cardDeck.popLast()
    }
 
    public mutating func reset() {
        cardDeck.removeAll()
        Shape.allCases.forEach{ shape in
            Number.allCases.forEach{ number in
                cardDeck.append(Card(shape: shape, number: number))
            }
        }
    }
}
