//
//  Game.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Game {
    
    private var players: Players
    private var dealer: Dealer
    private var style: Style
    var gamersCount: Int {
        return players.count
    }
    
    init(players: Players, style: Style){
        dealer = Dealer()
        self.players = players
        self.players.addGamers(gamer: dealer)
        self.style = style
        distributeByNubmers()
    }
    
    func pirntCards() {
        players.forEach { game in
            game.printCard()
        }
    }
    
    private func distributeByNubmers() {
        style.forEach {
            distributeCard()
        }
    }
    
    private func distributeCard() {
        players.forEach { gamer in
            gamer.addCard(card: dealer.pushCard())
        }
    }
}

extension Game {
    static func fiveCardStud(gamers: Players) -> Game {
        return Game (
            players: gamers,
            style: .five
        )
    }
    
    static func sevenCardStud(gamers: Players) -> Game {
        return Game (
            players: gamers,
            style: .seven
        )
    }
}
