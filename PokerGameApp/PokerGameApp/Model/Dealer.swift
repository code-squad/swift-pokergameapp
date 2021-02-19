//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/17.
//

import Foundation

class Dealer: Playable {
    private var cardsInHand: Array<Card>
    
    init() {
        cardsInHand = []
    }
    func receive(card: Card) {
        cardsInHand.append(card)
    }
    
    func cardInfo() -> Array<Card> {
        return cardsInHand
    }
}

extension Dealer: CustomStringConvertible {
    var description: String {
        return "딜러 \(cardsInHand)"
    }
}
