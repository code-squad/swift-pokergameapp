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
    
    mutating func addGamers(gamer: Player) {
        players.append(gamer)
    }
}
