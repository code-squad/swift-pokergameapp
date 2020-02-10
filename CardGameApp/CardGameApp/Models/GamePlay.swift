//
//  GamePlay.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/10.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class GamePlay {
    enum Rule: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
    }

    enum NumberOfPlayers: Int {
        case two = 2
        case three = 3
        case four = 4
    }
    
    let rule: Rule
    let numberOfPlayers: NumberOfPlayers
    let players: [Player]
    
    init(rule: Rule, numberOfPlayers: NumberOfPlayers) {
        self.rule = rule
        self.numberOfPlayers = numberOfPlayers
        self.players = (0..<numberOfPlayers.rawValue).map { _ in Player() }
    }
}

class Player {
    let cards = [Card]()
}
