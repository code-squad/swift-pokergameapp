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
    enum Rule {
        case fiveStud, sevenStud
    }

    let playerRange = 1...4
    let rule: Rule
    let dealer: Dealer
    let players: [Player]
    
    init(rule: Rule, numberOfPlayers: Int) throws {
        guard playerRange.contains(numberOfPlayers) else {
            throw GameError.invalidPlayers
        }
        
        self.rule = rule
        
        // 플레이어 생성
        self.players = (1...numberOfPlayers).map { _ in
            Player()
        }
        
        let deck = DeckFactory.create()
        self.dealer = Dealer(deck: deck)
    }
    
    func start() {
        dealer.startGame(players: players)
    }
    
    enum GameError: Error {
        case invalidPlayers
    }
}

