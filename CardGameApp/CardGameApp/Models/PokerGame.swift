//
//  PokerGame.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class PokerGame {
    let gameType: GameType
    let numberOfPlayers: Int
    var players: [Player] = []
    let dealer: Dealer
    
    init(game gameType: GameType, numberOfPlayers: Int) {
        self.gameType = gameType
        self.numberOfPlayers = numberOfPlayers
        self.dealer = Dealer(game: gameType)
        setupPlayersHands()
        dealer.setupCommunityCards()
    }
    
    private func setupPlayersHands() {
        for _ in 0..<numberOfPlayers {
            guard let hands = dealer.drawHands() else {
                print("카드가 부족합니다.")
                return
            }
            players.append(Player(hands: hands))
        }
    }
}

enum GameType: Int {
    case sevenCardsStud, fiveCardsStud
}
