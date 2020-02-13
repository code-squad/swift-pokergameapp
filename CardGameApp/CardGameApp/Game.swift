//
//  Game.swift
//  CardGameApp
//
//  Created by Viet on 2020/02/11.
//  Copyright © 2020 Viet. All rights reserved.
//

import Foundation

// 플레이어는 1~4명
struct Game {
    enum Rule: Int {
        case fiveStud = 5
        case sevenStud = 7
    }

    let playerRange = 1...4
    let rule: Rule
    let dealer: Dealer
    let players: [Playable]
    
    init(rule: Rule, players: [Playable]) throws {
        guard playerRange.contains(players.count) else {
            throw GameError.playersOutOfRange
        }
        
        self.players = players
        self.rule = rule
        
        let deck = CardGameFactory.createDeck()
        self.dealer = Dealer(deck: deck)
    }
    
    func start() {
        dealer.startGame(rule: rule, players: players)
    }
}

enum GameError: Error {
    case playersOutOfRange
}
