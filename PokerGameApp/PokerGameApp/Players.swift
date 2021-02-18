//
//  Players.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/18.
//

import Foundation

class Players {
    
    private let players: [Player]
    let count: Int
    
    init(players: [Player]) {
        self.players = players
        self.count = players.count
    }
}
