//
//  File.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/25.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Players {
    private(set) var players = [Player]()
    
    func joinPlayerToGame(playerEntry: PlayerEntry, dealer: Dealer) {
        var index = 1
        playerEntry.each {
            players.append(Player(name: "Player\(index)"))
            index += 1
        }
        players.append(dealer)
    }
    
    func initDrawCard(studType: StudType, dealer: Dealer) {
        players.forEach { (player) in
            studType.each {
                let card = dealer.drawCard()
                player.bringCard(card: card)
            }
        }
    }
    
    func searchWinnerIndexNum(winner: Player) -> Int {
        return players.firstIndex(of: winner)!
    }
    
    func highestScorePlayer() -> Player {
        var highestPriorityPlayer = players[0]
        
        for index in 0 ..< players.count-1 {
            highestPriorityPlayer = comparePlayerScore(currentPlayer: highestPriorityPlayer, nextPlayer: players[index+1])
        }
        
        return highestPriorityPlayer
    }
    
    private func comparePlayerScore(currentPlayer:Player, nextPlayer:Player) -> Player {
        var highPriorityPlayer = currentPlayer
        if currentPlayer == nextPlayer {
            if currentPlayer.score.highestPairCard! < nextPlayer.score.highestPairCard! {
                highPriorityPlayer = nextPlayer
            }
        } else if currentPlayer < nextPlayer {
            highPriorityPlayer = nextPlayer
        }
        
        return highPriorityPlayer
    }
}
