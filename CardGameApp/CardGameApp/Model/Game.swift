//
//  Game.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

@objcMembers class Game: NSObject {
    
    private var players: Players
    private var dealer: Dealer
    private var style: Style
    private var peoples: Peoples
    
    init(players: Players, style: Style, peoples: Peoples){
        dealer = Dealer()
        self.players = players
        self.style = style
        self.peoples = peoples
        super.init()
        configure()
        dealer.shuffle()
    }

    func configure(index: Int = 0) {
        dealer.newGame()
        peoples = Peoples(index: index)
        distributePlayers()
    }
    
    func translateStyle(style: Style) {
        dealer.newGame()
        self.style = style
        players.forEach { player in
            style.isEqual(players.count) ? popCard(player: player) : pushCard(player: player)
        }
    }
    
    func pushPlayerToView(handler: (Player) -> Void) {
        players.forEach { player in
            handler(player)
        }
    }
    
    private func pushCard(player: Player) {
        (1...2).forEach { _ in
            player.removeLast()
        }
    }
    
    private func popCard(player: Player) {
        (1...2).forEach { _ in
            player.addCard(card: dealer.pushCard())
        }
    }
    
    private func distributePlayers() {
        players.replacingPlayers(peoples: peoples) { player in
            distribute(player: player)
        }
        dealer.clearCards()
        distribute(player: dealer)
        players.addGamer(player: dealer)
    }
    
    private func distribute(player: Player) {
        style.forEach {
            player.addCard(card: dealer.pushCard())
        }
    }
}

extension Game {
    static func fiveCardStud(gamers: Players) -> Game {
        return Game (
            players: gamers,
            style: .five,
            peoples: .two
        )
    }
    
    static func sevenCardStud(gamers: Players) -> Game {
        return Game (
            players: gamers,
            style: .seven,
            peoples: .two
        )
    }
}
