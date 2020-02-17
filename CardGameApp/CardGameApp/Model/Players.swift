//
//  Players.swift
//  CardGameApp
//
//  Created by delma on 17/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Players {
    private var players = [Player]()
    
    func append(player: Player) {
        players.append(player)
    }
    
    func forEachPlayer(handler: (Player) -> ()) {
        players.forEach {
            handler($0)
        }
    }
}
