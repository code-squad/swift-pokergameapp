//
//  Dealer.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Dealer: Playable{
    private var cardDeck = CardDeck()
    private var cards = [Card]()
    
    func removeOne() -> Card? {
        return cardDeck.removeOne()
    }
    
    func leftCards() -> Int {
        return cardDeck.count()
    }
    
    func appendCard(_ card: Card) {
        cards.append(card)
    }
    
    func shuffle() {
        cardDeck.shuffle()
    }
    
    func cardsInfo() -> [Card]{
        return cards
    }
    
    func cardsInfo2(hander: (Card) -> String) {
        for card in cards {
            print(hander(card))
        }
    }
    
    func cardsWithImageInfo() -> [String] {
       let cardsInfo = cards.map { (card) in
        card.description
        }
        return cardsInfo
    }
}
