//
//  Player.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/18.
//

import Foundation

class Player: CustomStringConvertible {
    var description: String{
        return cards.description
    }
    
    private var cards: [Card]
    
    init() {
        self.cards = [Card]()
    }
    
    func receiveCard(card: Card) {
        cards.append(card)
    }
    
    
    func retrieveCard(completion: (Card) -> Void) {
        cards.forEach { (card) in
            completion(card)
        }
    }
}
