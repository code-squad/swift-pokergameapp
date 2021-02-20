//
//  Players.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/18.
//

import Foundation

class Players {
    
    private let players: [Player]
    let count: Int
    
    init(players: [Player]) {
        self.players = players
        self.count = players.count
    }
    
    init(numberOfPlayers: PokerGame.Size) {
        self.players = numberOfPlayers.namePlayers()
        self.count = self.players.count
    }
    
    func dealt(_ cards: [Card]) {
        var cardsFromDealer = cards
        players.forEach { $0.dealt(cardsFromDealer.removeFirst()) }
    }
    
    func showdown() -> [ShowdownCards] {
        return players.map { $0.showdown() }
    }
}
