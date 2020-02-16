//
//  Game.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Game {
    
    private var gamers: Player
    private var dealer: Dealer = Dealer()
    private var style: GameStyle
    
    init(gamers: Player, style: GameStyle){
        self.gamers = gamers
        self.style = style
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
