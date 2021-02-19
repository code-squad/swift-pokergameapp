//
//  Players.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

class Players {
    private var players : [Player]
    
    init(howManyPlayer playerCount : Int) {
        self.players = []
        for _ in 0..<playerCount {
            self.players.append(Player.init())
        }
    }
    
    func selectPlayer(who playerNumber : Int) -> Player {
        return players[playerNumber]
    }
    
}
