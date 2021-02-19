//
//  Playable.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/19.
//

import Foundation

class Playable {
    private(set) var cards: [Card]
    
    init() {
        cards = []
    }
    
    func getCard(from cards: [Card]) {
        self.cards += cards
    }
    
    func openCards() {
        for i in 0..<cards.count {
            if cards[i].face == .down {cards[i].face = Face.up}
        }
    }
}
