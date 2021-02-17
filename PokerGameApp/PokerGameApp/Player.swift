//
//  Player.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation

struct Player {
    var playerID: Int = 0
    var playerCardDeck: Array<Card>?
    
    init(id: Int) {
        playerID = id
    }
    
    mutating func receive(card: Card) {
        if playerCardDeck != nil {
            playerCardDeck?.append(card)
        } else {
            playerCardDeck = [card]
        }
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        return "참가자#\(self.playerID) \(playerCardDeck ?? [])"
    }
}
