//
//  Player.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

class Player {
    private var cards : [Card] = []
    
    func receiveCard(card : Card) {
        cards.append(card)
    }
    
    func showCards() -> [Card] {
        return cards
    }
    
    func resetCard() {
        cards.removeAll()
    }
    
    func countCard() -> Int {
        return cards.count
    }
}
