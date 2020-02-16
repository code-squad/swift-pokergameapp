//
//  Game.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Game {
    
    private var gamers: Player
    private var dealer: Dealer
    private var style: GameStyle
    private var limitCount: Int
    
    init(gamers: Player, style: GameStyle, limitCount: Int){
        self.gamers = gamers
        dealer = Dealer()
        self.style = style
        self.limitCount = limitCount
        distributeByNubmers()
    }

    func pirntCards() {
//        gamers.forEach { game in
//            game.printCard()
//        }
    }
    
    private func distributeByNubmers() {
//        (1...style.description).forEach { _ in
//            distributeCard()
//        }
    }
    
    private func distributeCard() {
//        gamers.forEach { gamer in
//            gamer.addCard(card: dealer.pushCard())
//        }
    }
}

extension Game {
    static func fiveCardStud(gamers: Player) -> Game {
        return Game (
            gamers: gamers,
            style: .five,
            limitCount: 5
        )
    }
    
    static func sevenCardStud(gamers: Player) -> Game {
        return Game (
            gamers: gamers,
            style: .seven,
            limitCount: 7
        )
    }
}
