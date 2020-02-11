//
//  PokerGame.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class PokerGame {
    let gameType: GameType
    let numberOfPlayers: Int
    var players: [Player] = []
    let dealer: Dealer
    
    init(type gameType: GameType, numberOfPlayers: Int) {
        self.gameType = gameType
        self.numberOfPlayers = numberOfPlayers
        self.dealer = Dealer()
        for _ in 0..<numberOfPlayers { players.append(Player()) }
    }
}

enum GameType: Int {
    case sevenCardsStud, fiveCardsStud
}
