//
//  Player.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation

class Player: Playable {
    private var id: Int = 0
    private var cardsInHand: Array<Card>
    
    init(id: Int) {
        self.id = id
        self.cardsInHand = []
    }
    
    func receive(card: Card) {
        cardsInHand.append(card)
    }
    
    func cardInfo() -> Array<Card> {
        return cardsInHand
    }
    
    public func resetPlayer() {
        cardsInHand = []
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        return "참가자#\(self.id) \(cardsInHand)"
    }
}
