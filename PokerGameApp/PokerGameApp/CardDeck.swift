//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by user on 2021/02/16.
//

import Foundation

struct CardDeck {
    var Cards: [PokerCard] = []
    var count: Int {
        return Cards.count
    }
    
    init() {
        self.Cards = makeCards()
    }
    
    private func makeCards() -> [PokerCard] {
        var tempCards:[PokerCard] = []
        for suit in PokerCard.Suit.allCases {
            for rank in PokerCard.Rank.allCases {
                tempCards.append(PokerCard(suit: suit, rank: rank))
            }
        }
        return tempCards
    }
    
    //  Fisher-Yates shuffle(Knuth)
    mutating func shuffle() {
        var randomRange = self.count - 1
        
        while randomRange != 0 {
            let pickedIndex = Int.random(in: 0...randomRange)
            self.Cards.swapAt(randomRange, pickedIndex)
            randomRange -= 1
        }
    }
    
    mutating func removeOne() -> PokerCard? {
        return self.Cards.popLast()
    }
    
    mutating func reset() {
        self.Cards = makeCards()
    }
}
