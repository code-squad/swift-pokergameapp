//
//  Player.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/18.
//

import Foundation

class Player {
    private var cards: [Card] = [] 
    private var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func receiveCard(_ card: Card) {
        cards.append(card)
    }
    
    func getCard() -> [Card] {
        return cards
    }
}
