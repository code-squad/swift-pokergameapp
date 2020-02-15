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
    enum GameStut : Int {
        case five = 5, seven = 7
    }
    private let gameStut : GameStut
    
    init?(gameStut : GameStut , playersNumber: Int) throws {
        guard playersNumber >= minPlayersNumber,
            playersNumber <= maxPlayersNumber else {
                throw PokerGameError.invalidPlayersNumber
        }
        self.gameStut = gameStut
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
