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
        var winnerIndex = 0
        print(winner.name)
        for index in 0 ..< players.count {
            if players[index].name == winner.name {
                winnerIndex = index
            }
        }
        return winnerIndex
    }
}
