//
//  Player.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Players {
    
    private var gamers: [Player] = []
    var count: Int {
        return gamers.count
    }
    
    func forEach(handler: (Player) -> Void) {
        gamers.forEach { gamer in
            handler(gamer)
        }
    }
    
    mutating func addGamers(gamer: Player) {
        gamers.append(gamer)
    }
}
