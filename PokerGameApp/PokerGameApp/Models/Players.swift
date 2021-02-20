//
//  Players.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/19.
//

import Foundation

class Players {
    private var dealer: Dealer
    private var players: [Player]
    
    init(dealer: Dealer, players: [Player]) {
        self.dealer = dealer
        self.players = players
    }
    
    func getDealerInfo() -> Dealer {
        return self.dealer
    }
    
    func getPlayersInfo() -> [Player] {
        return self.players
    }
    
    func appendPlayer(_ player: Player) {
        players.append(player)
    }
}
