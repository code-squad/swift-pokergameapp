//
//  Player.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Players {
    
    private var players: [Player] = []
    var count: Int {
        return players.count
    }
    
    func forEach(handler: (Player) -> Void) {
        players.forEach { handler($0) }
    }
    
    mutating func replacingPlayers(peoples: Peoples, handler: (Player) -> Void) {
        players = []
        peoples.forEach { players.append(Player(identifier: "players\($0)")) }
        players.forEach { handler($0) }
    }
    
    mutating func addGamer(player: Player) {
        players.append(player)
    }
    
    mutating func addGamers(contentsOf: [Player]) {
        self.players.append(contentsOf: players)
    }
}
