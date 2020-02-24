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
        players.forEach { gamer in
            handler(gamer)
        }
    }
    
    mutating func replacingPlayers(peoples: Peoples, handler: (Player) -> Void) {
        players = []
        peoples.forEach { players.append(Player(identifier: "players\($0)")) }
        players.forEach { player in
            handler(player)
        }
    }
    
    mutating func addGamers(gamer: Player) {
        players.append(gamer)
    }
}
