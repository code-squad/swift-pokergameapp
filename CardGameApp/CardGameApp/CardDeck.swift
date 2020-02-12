//
//  CardDeck.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/11.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

struct CardDeck {
    var cards : [Card] = []
    
    init() {
//        cards = self.reset()
    }
    
    mutating func reset() -> [Card]{
        var suitsOfCard = Card.Suit.allCases
        var ranksOfCard = Card.Rank.allCases
        
        ranksOfCard.forEach{ rank in
            for suit in suitsOfCard {
                let newCard = Card(suit: suit, rank: rank)
                cards.append(newCard)
            }
        }
        return cards
    }
    
    func shuffle() {
        
    }
    
    func removeOne(of: Int) -> Card {
        
        return cards[0]
    }
    
    func count() {
        
    }
}
extension CardDeck :Equatable{
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards.count == rhs.cards.count
        return lhs.cards == rhs.cards
    }
}
