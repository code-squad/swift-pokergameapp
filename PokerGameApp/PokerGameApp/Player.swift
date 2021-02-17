//
//  Player.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation

class Player: Receiver {
    private var id: Int = 0
    private var cardsInHand: Array<Card>
    
    init(id: Int) {
        self.id = id
        self.cardsInHand = []
    }
    
    func receive(card: Card) {
        cardsInHand.append(card)
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        return "참가자#\(self.id) \(cardsInHand)"
    }
}
