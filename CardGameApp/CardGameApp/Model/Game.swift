//
//  Game.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Game {
    
    private var gamers: Players
    private var dealer: Dealer
    private var style: Style
    var gamersCount: Int {
        return gamers.count
    }
    
    init(gamers: Players, style: Style){
        dealer = Dealer()
        self.gamers = gamers
        self.gamers.addGamers(gamer: dealer)
        self.style = style
        distributeByNubmers()
    }
    
    func pirntCards() {
        gamers.forEach { game in
            game.printCard()
        }
    }
    
    private func distributeByNubmers() {
        style.forEach {
            distributeCard()
        }
    }
    
    private func distributeCard() {
        gamers.forEach { gamer in
            gamer.addCard(card: dealer.pushCard())
        }
    }
}

extension Game {
    static func fiveCardStud(gamers: Players) -> Game {
        return Game (
            gamers: gamers,
            style: .five
        )
    }
    
    static func sevenCardStud(gamers: Players) -> Game {
        return Game (
            gamers: gamers,
            style: .seven
        )
    }
}
