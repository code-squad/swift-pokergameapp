//
//  Player.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/18.
//

import Foundation

enum PlayerType: String {
    case Dealer = "딜러"
    case Pariticipant = "참가자"
}

class Player {
    private var cards: [Card] = [] 
    private var name: PlayerType
    
    init(name: PlayerType) {
        self.name = name
    }
    
    func receiveCard(_ card: Card) {
        cards.append(card)
    }
    
    func getCard() -> [Card] {
        return cards
    }
}
