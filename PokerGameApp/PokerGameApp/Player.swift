//
//  Player.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation

class Player {
    private var id: Int = 0
    private var cardDeck: Array<Card>
    
    init(id: Int) {
        self.id = id
        self.cardDeck = []
    }
    
    public func receive(card: Card) {
        cardDeck.append(card)
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        return "참가자#\(self.id) \(cardDeck)"
    }
}
