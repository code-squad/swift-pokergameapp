//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/16.
//

import Foundation

struct cardDeck {
    private var cardDeckArr: [String] = []
    
    mutating func makeCardDeck()  {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                self.cardDeckArr.append("\(suit)\(rank)")
            }
        }
    }
    mutating func count() -> Int {
        let cardDeckCount = cardDeckArr.count
        return cardDeckCount
    }
    
    mutating func shuffle() {
        cardDeckArr = cardDeckArr.shuffled()
    }
    
    mutating func removeOne() -> String? {
        return cardDeckArr.removeLast()
    }
    
    mutating func reset() {
        cardDeckArr.removeAll()
        makeCardDeck()
    }
}
