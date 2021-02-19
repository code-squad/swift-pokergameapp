//
//  Player.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/19.
//

import Foundation

class Player {
    private(set) var cards: [Card]
    private(set) var betting: Int
    let index: Int
    
    init(index: Int) {
        self.cards = []
        self.betting = 0
        self.index = index
    }
    
    func getCard(from cards: [Card]) {
        self.cards += cards
    }
    
    func bet(money: Int) {
        betting += money
    }
    
    func openCard() {
        for i in 0..<cards.count {
            if cards[i].face == .down {cards[i].face = Face.up}
        }
    }
}
