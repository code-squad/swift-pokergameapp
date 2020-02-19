//
//  PokerGame.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class PokerGame {
    private let gameType: GameType
    private let playerCount: PlayerCount
    private(set) var players: Players!
    private var winner: Player!
    let dealer = Dealer()
    
    init(game gameType: GameType = .sevenCardsStud, numberOfPlayers: PlayerCount = .two) {
        self.gameType = gameType
        self.playerCount = numberOfPlayers
    }
    
    func findWinner(completion: (Player) -> ()) {
        winner = players.winner()
        completion(winner)
    }
    
    func resetPlayers(_ players: [Player] = []) {
        self.players = Players(players: players)
        self.players.setupPlayers(playerCount: playerCount, with: dealer)
    }
    
    func passCards(completion: (Players) -> ()) {
        players.forEachPlayer { (player) in
            guard let card = dealer.drawCard() else { return }
            player.takeCard(card)
        }
        completion(players)
    }
    
    func forEachPlayer(_ handler: (Player) -> ()) {
        players.forEachPlayer(handler)
    }
}

enum GameType: Int, CaseIterable {
    case sevenCardsStud = 7, fiveCardsStud = 5
    
    init(index: Int) {
        self = GameType.allCases[index]
    }
    
    func forEachCard(handler: () -> ()) {
        for _ in 0..<self.rawValue {
            handler()
        }
    }
}

enum PlayerCount: Int, CaseIterable {
    case two = 2, three, four
    
    init(index: Int) {
        self = PlayerCount.allCases[index]
    }
    
    func forEach(_ handler: () -> ()) {
        for _ in 0..<self.rawValue {
            handler()
        }
    }
}
