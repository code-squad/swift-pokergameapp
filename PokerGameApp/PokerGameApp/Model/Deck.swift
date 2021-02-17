//
//  Deck.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/17.
//

import Foundation

class Deck {
    private var handCard : [Card] = []
    
    func receiveCard(card : Card) {
        handCard.append(card)
    }
    
    func showCards() -> [Card] {
        return handCard
    }
    
    func resetCard() {
        handCard.removeAll()
    }
    
    func countCard() -> Int {
        return handCard.count
    }
    
    func emptyCard() -> Bool {
        return handCard.isEmpty
    }
}
