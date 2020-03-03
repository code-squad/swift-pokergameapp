//
//  Player.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Players {
    
    private var players: [Player] = []
    
    func forEach(handler: (Player) -> Void) {
        players.forEach { handler($0) }
    }
    
    func searchWinner() {
        let topPlayer = players.sorted { $0 > $1 }.first ?? Player(identifier: "")
        topPlayer.toggleWinner()
        var count = 0
        players.forEach { $0 == topPlayer ? count += 1 : nil }
        count > 2 ? choiceTopValue() : nil
    }
    
    private func choiceTopValue() {
        players.forEach { $0.resetWinnerState() }
        let topValue = players.sorted { $0.topValue > $1.topValue }.first ?? Player(identifier: "")
        topValue.toggleWinner()
    }
    
    mutating func replacingPlayers(peoples: Game.NumberOfPlayers, handler: (Player) -> Void) {
        players = []
        peoples.forEach { players.append(Player(identifier: "players\($0)")) }
        players.forEach { handler($0) }
    }
    
    mutating func addGamer(player: Player) {
        players.append(player)
    }
    
    mutating func addGamers(contentsOf: [Player]) {
        self.players.append(contentsOf: players)
    }
}
