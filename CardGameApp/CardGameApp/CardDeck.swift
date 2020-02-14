//
//  CardDeck.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/11.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards : [Card] = []
    
    init() {
        cards = self.reset()
    }
    
    mutating func reset() -> [Card]{
        let suitsOfCard = Card.Suit.allCases
        let ranksOfCard = Card.Rank.allCases
        
        ranksOfCard.forEach{ rank in
            suitsOfCard.forEach{ suit in
                let newCard = Card(suit: suit, rank: rank)
                cards.append(newCard)
            }
        }
        return cards
    }
    
    mutating func shuffle() {
        self.cards.shuffle()
    }
    
    mutating func removeOne(of index: Int) -> Card {
        let cardToRemove = self.cards[index]
        self.cards.remove(at: index)
        return cardToRemove
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    func pickCard(of index: Int) -> Card {
        return self.cards[index]
    }
    
//    func areCardsDuplicated() -> Bool{
//        
//    }
    
}
extension CardDeck :Equatable{
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards == rhs.cards
    }
}
