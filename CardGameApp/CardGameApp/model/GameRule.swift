//
//  GameRule.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/03/02.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class GameRule {
    func judgePriority(participants:Players) -> Player {
        let players = participants.players
        var highestPriorityPlayer = players[0]
        
        for index in 0 ..< players.count-1 {
            highestPriorityPlayer = comparePriority(currentPlayer: highestPriorityPlayer, nextPlayer: players[index+1])
        }
        print(highestPriorityPlayer.name)
        return highestPriorityPlayer
    }
    
    func comparePriority(currentPlayer:Player, nextPlayer:Player) -> Player {
        var highPriorityPlayer = currentPlayer
        if currentPlayer.score == nextPlayer.score {
            if currentPlayer.score.highestPairCard! < nextPlayer.score.highestPairCard! {
                highPriorityPlayer = nextPlayer
            }
        } else if currentPlayer.score < nextPlayer.score {
            highPriorityPlayer = nextPlayer
        } 
        
        return highPriorityPlayer
    }
}
