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
    
}
