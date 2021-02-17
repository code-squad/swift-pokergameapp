//
//  Players.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/17.
//

import Foundation

class Players {
    var players: Array<Player> = []
    
    init(numberOfPlayers: Int) {
        for i in 1...numberOfPlayers {
            players.append(Player(id: i))
        }
    }
}
