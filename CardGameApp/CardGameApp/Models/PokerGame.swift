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
    private let numberOfPlayers: Int
    var players: [Player] = []
    let dealer: Dealer
    
    init(game gameType: GameType, numberOfPlayers: PlayerCount) {
        self.gameType = gameType
        self.numberOfPlayers = numberOfPlayers.rawValue
        self.dealer = Dealer(game: gameType)
        setupHands()
    }
    
    private func setupHands() {
        setupPlayersHands()
        dealer.setupCommunityCards()
    }
    
    private func setupPlayersHands() {
        for _ in 0..<numberOfPlayers {
            guard let hands = dealer.drawHands() else { return }
            players.append(Player(hands: hands))
        }
    }
}

enum GameType: Int, CaseIterable {
    case sevenCardsStud = 7, fiveCardsStud = 5
    
    init(index: Int) {
        self = GameType.allCases[index]
    }
    
    func numberOfHands() -> Int {
        return self.rawValue
    }
}

enum PlayerCount: Int, CaseIterable {
    case two = 2, three, four
    
    init(index: Int) {
        self = PlayerCount.allCases[index]
    }
}
