//
//  PokerGame.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class PokerGame {
    enum GameType: Int, CaseIterable {
        case sevenCardStud = 7
        case fiveCardStud = 5
        
        init(index: Int) {
            self = GameType.allCases[index]
        }
        
        func forEach(_ transform: () -> ()) {
            for _ in 1...self.rawValue {
                transform()
            }
        }
    }
    enum NumberOfPlayers: Int, CaseIterable {
        case two = 2
        case three = 3
        case four = 4
        
        init(index: Int) {
            self = NumberOfPlayers.allCases[index]
        }
        
        func forEach(_ transform: () -> ()) {
            for _ in 1...self.rawValue {
                transform()
            }
        }
    }
    private var dealer: Dealer
    private var players = Players()
    private var gameType: GameType
    private var resumable: Bool {
        dealer.deckCount > (players.count) * gameType.rawValue
    }
    
    init(gameType: GameType, numberOfPlayers: NumberOfPlayers) {
        self.gameType = gameType
        self.dealer = Dealer()
        numberOfPlayers.forEach {
            self.players.add(player: Player())
        }
        players.add(player: dealer)
    }
    
    func forEachPlayers(_ transform: (Player) -> ()) {
        players.forEach(transform)
    }
    
    func distributeCards() {
        players.forEach {
            guard let drawnCard = dealer.drawCard() else {
                return
            }
            $0.receive(drawnCard)
        }
    }
        
    func play() {
        while resumable {
            players.discardAll()
            dealer.shuffle()
            gameType.forEach {
                distributeCards()
            }
        }
    }
}
