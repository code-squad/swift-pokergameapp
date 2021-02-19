//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/17.
//

import Foundation

class CardDeck {
    private var cards = [Card]()
    private let initialCards: [Card]
    
    init() {
        for shape in Shape.allCases {
            for rank in Rank.allCases {
                let card = Card(shape: shape, rank: rank, face: .up)
                self.cards.append(card)
            }
        }
        self.initialCards = self.cards
    }
    
    func countCard() -> Int {
        return cards.count
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func takeOutCard() -> Card {
        return cards.removeFirst()
    }
    
    func reset() {
        cards = initialCards
    }
    
    func showCardDect() -> [Card] {
        return cards
    }
}
