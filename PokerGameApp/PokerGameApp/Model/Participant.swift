//
//  Participant.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

class Participant: Player {
    
    private var name: String
    private var cards: [Card] = []
    
    init() {
        self.name = "참가자"
    }
    
    func receiveCard(_ card: Card) {
        cards.append(card)
    }
    
    func eachCard(method: (Card) -> ()) {
        cards.forEach{method($0)}
    }
    
    func resetCard() {
        cards.removeAll()
    }
}
