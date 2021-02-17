//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/16.
//

import Foundation

struct CardDeck {
    private var deck: [Card] = []
    
    init() {
        setCardDeck()
    }
    
    private mutating func setCardDeck() {
        Suit.allCases.forEach { suit in
            Rank.allCases.forEach { rank in
                deck.append(Card(rank: rank, suit: suit))
            }
        }
    }
    
    
    
}
