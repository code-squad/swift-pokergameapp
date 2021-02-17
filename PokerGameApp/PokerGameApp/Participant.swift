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
extension Participant: CustomStringConvertible {
    var description: String {
        var str = cards.map({"\($0)"}).joined(separator: " ,")
        str.insert("[", at: str.startIndex)
        str.append("]\n")
        return str
    }
}
