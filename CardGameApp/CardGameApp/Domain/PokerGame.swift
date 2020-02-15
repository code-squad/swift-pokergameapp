//
//  PokerGame.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class PokerGame {
    
    private let deck = Deck()
    private let dealer = Player()
    private var players: [Player]!
    
    init?(playersNumber: Int) throws {
        guard playersNumber >= minPlayersNumber,
            playersNumber <= maxPlayersNumber else {
                throw PokerGameError.invalidPlayersNumber
        }
        players = initPlayers(num: playersNumber)
    }
    
    private func initPlayers(num: Int) -> [Player] {
        var players = [Player]()
        for _ in 0 ..< num {
            players.append(Player())
        }
        return players
    }
}

let minPlayersNumber = 1
let maxPlayersNumber = 4
enum PokerGameError: Error {
    case invalidPlayersNumber
}
