//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by user on 2021/02/16.
//

import Foundation

struct CardDeck {
    private var cards: [PokerCard] = []
    var count: Int {
        return cards.count
    }
    
    init() {
        self.reset()
    }
    
    mutating func reset() {
        var tempCards:[PokerCard] = []
        for suit in PokerCard.Suit.allCases {
            for rank in PokerCard.Rank.allCases {
                tempCards.append(PokerCard(suit: suit, rank: rank))
            }
        }
        self.cards = tempCards
    }
    
    //  Fisher-Yates shuffle(Knuth)
    mutating func shuffle() {
        var randomRange = self.count - 1
        
        while randomRange != 0 {
            let pickedIndex = Int.random(in: 0...randomRange)
            self.cards.swapAt(randomRange, pickedIndex)
            randomRange -= 1
        }
    }
    
    mutating func removeOne() -> PokerCard? {
        return self.cards.popLast()
    }
}
