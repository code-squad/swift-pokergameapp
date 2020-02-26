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
    
    func compare() -> (result: GameResult, equalParticipants: [Player]) {
        var gameResult = GameResult.none
        var equalParticipants: [Player] = []

        forEachPlayer { (player) in
            let result = player.result()
            if result > gameResult {
                gameResult = result
                equalParticipants.removeAll()
                equalParticipants.append(player)
            }else if result == gameResult {
                equalParticipants.append(player)
            }
        }
        
        return (gameResult, equalParticipants)
    }
}
