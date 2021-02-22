//
//  Player.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/18.
//

import Foundation

class Player: CustomStringConvertible {
    
    private var cards: [Card]
    
    init() {
        self.cards = [Card]()
    }
    
    func takeCard(with cards: [Card]) {
        self.cards = cards
    }
    
    func retrieveCard(completion: (Card) -> Void) {
        cards.forEach { (card) in
            completion(card)
        }
    }

    var description: String {
        return "\(cards)"
    }
}
