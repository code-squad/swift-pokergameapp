//
//  PokerGame.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class PokerGame {
    var dealer: Dealer
    var players = [Player]()
    enum GameType: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    var gameType: GameType
    var resumable: Bool {
        dealer.deck.count > (players.count) * gameType.rawValue
    }
    
    init(gameType: GameType, numberOfPlayers: Int) {
        self.gameType = gameType
        self.dealer = Dealer()
        for _ in 1...numberOfPlayers {
            players.append(Player())
        }
        players.append(dealer)
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
        players.forEach {
            $0.discard()
        }
        dealer.shuffle()
        for _ in 1...gameType.rawValue {
            distributeCards()
        }
    }
    
    func run() {
        while resumable {
            play()
        }
    }
}
