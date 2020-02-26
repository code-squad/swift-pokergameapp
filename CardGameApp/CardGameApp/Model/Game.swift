//
//  Game.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

@objcMembers class Game: NSObject {
    
    enum Style: Int {
        case five = 5
        case seven = 7
        
        func forEach(handler: () -> Void) {
            (1...self.rawValue).forEach { _ in
                handler()
            }
        }
        
        func isEqual(_ compare: Int) -> Bool {
            (self.rawValue - compare) > 0 ? true : false
        }
    }

    enum Peoples: Int, CaseIterable {
        case two = 2
        case three = 3
        case four = 4
        
        init(index: Int) {
            self = Peoples.allCases[safe: index] ?? .two
        }
        
        func forEach(handler: (Int) -> Void) {
            (1...self.rawValue).forEach { handler($0) }
        }
    }
    
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
        players.forEach { style.isEqual($0.count) ? allowCards(player: $0) : discardCards(player: $0) }
    }
    
    func pushPlayerToView(handler: (Player) -> Void) {
        players.forEach { handler($0) }
    }
    
    private func discardCards(player: Player) {
        (1...2).forEach { _ in
            player.removeLast()
        }
    }
    
    private func allowCards(player: Player) {
        (1...2).forEach { _ in
            player.addCard(card: dealer.pushCard())
        }
    }
    
    private func distributePlayers() {
        players.replacingPlayers(peoples: peoples) { distribute(to: $0) }
        dealer.clearCards()
        distribute(to: dealer)
        players.addGamer(player: dealer)
    }
    
    private func distribute(to player: Player) {
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
