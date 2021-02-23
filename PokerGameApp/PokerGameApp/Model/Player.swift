//
//  Player.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/18.
//

import Foundation

class Player: CustomStringConvertible, Playable {
    
    private var cards: [Card]
    private(set) var name: String
    
    init(name: String) {
        self.cards = [Card]()
        self.name = name
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
