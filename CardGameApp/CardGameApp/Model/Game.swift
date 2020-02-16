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
    private var limitCount: Int
    var gamersCount: Int {
        return gamers.count
    }
    
    init(gamers: Players, limitCount: Int){
        dealer = Dealer()
        self.gamers = gamers
        self.gamers.addGamers(gamer: dealer)
        self.limitCount = limitCount
        distributeByNubmers()
    }
    
    
    func pirntCards() {
        gamers.forEach { game in
            game.printCard()
        }
    }
    
    private func distributeByNubmers() {
        (1...limitCount).forEach { _ in
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
            limitCount: 5
        )
    }
    
    static func sevenCardStud(gamers: Players) -> Game {
        return Game (
            gamers: gamers,
            limitCount: 7
        )
    }
}
