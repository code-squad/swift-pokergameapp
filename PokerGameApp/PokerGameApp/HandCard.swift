//
//  HandCard.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/19.
//

import Foundation

class HandCard {
    private var cards: [Card] = []
    var description: String {
        return cards.description
    }
    
    func append(card: Card) {
        cards.append(card)
    }
    
    func reset() {
        cards.removeAll()
    }
    
    func printCard() {
        print(cards)
    }
}
