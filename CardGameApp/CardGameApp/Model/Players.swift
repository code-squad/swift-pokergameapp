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
    
    mutating func searchWinner() {
        var winnerGrade = 0
        setWinner(winnerGrade: &winnerGrade)
        checkWinner(winnerGrade: &winnerGrade)
        var count = 0
        doubleCheck(count: &count)
    }
    
    func setWinner(winnerGrade: inout Int) {
        players.forEach { player in
            winnerGrade = player.compare(with: winnerGrade)
        }
    }
    
    func checkWinner(winnerGrade: inout Int) {
        players.forEach { player in
            player.findPlayer(with: winnerGrade) ? player.checkWinner() : nil
        }
    }
    
    func doubleCheck(count: inout Int) {
        players.forEach { player in
            player.winner ? count += 1 : nil
        }
        if count > 1 {
            players.sorted {
                $0.winner = false
                $1.winner = false
                return $0.topValue > $1.topValue
            }.first?
                .checkWinner()
        }
    }
}
