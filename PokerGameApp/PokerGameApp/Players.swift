//
//  Players.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/17.
//

import Foundation


class Players {
    private var players = [Player]()
    
    func addPlayer(particpatin : Int) {
        (1...particpatin).enumerated().forEach { number in
            players.append(Player(entryNumber: number.offset))
        }
    }
    
    func totalPlayer() -> Int {
        return players.count
    }
}
