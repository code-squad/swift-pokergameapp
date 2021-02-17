//
//  Participant.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

class Participant {
    private var cards: [Card] = []
    
    func receiveCard(_ card: Card) {
        cards.append(card)
    }
    
    var getCards: [Card] {
        return cards
    }
}
