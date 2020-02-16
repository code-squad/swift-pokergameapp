//
//  Player.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Players {
    
    private var gamers: [Gamer] = []
    var count: Int {
        return gamers.count
    }
    
    func forEach(handler: (Gamer) -> Void) {
        gamers.forEach { gamer in
            handler(gamer)
        }
    }
    
    mutating func addGamers(gamer: Gamer) {
        gamers.append(gamer)
    }
}
