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
    private var players: [Player] = []
    let dealer: Dealer
    
    init(game gameType: GameType = .sevenCardsStud, numberOfPlayers: PlayerCount = .two) {
        self.gameType = gameType
        self.playerCount = numberOfPlayers
        self.dealer = Dealer()
        
        setupPlayer()
        setupPlayersHand()
    }
    
    private func setupPlayer() {
        playerCount.forEach {
            players.append(Player())
        }
        players.append(dealer)
    }
    
    private func setupPlayersHand() {
        players.forEach {
            var hand: [Card] = []
            gameType.forEachCard {
                guard let card = dealer.drawCard() else { return }
                hand.append(card)
            }
            $0.setupHand(with: hand)
        }
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
