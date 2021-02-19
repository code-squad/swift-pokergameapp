//
//  Player.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/17.
//

import Foundation

class Player {
    enum PlayerType: String {
        case dealer = "Dealer 🛎"
        case player = "Player"
    }
    
    private(set) var playerType: PlayerType
    var handCard = HandCard()
    var description: String {
        return "\(playerType) \(handCard.description)"
    }
    
    init(playerType: PlayerType = .player) {
        self.playerType = playerType
    }
    
    func receive(card: Card) {
        handCard.append(card: card)
    }
    
    func reset() {
        handCard.reset()
    }
}

