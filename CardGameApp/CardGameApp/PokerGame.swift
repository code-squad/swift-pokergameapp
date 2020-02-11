//
//  PokerGame.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class PokerGame {
    enum GameType: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    enum NumberOfPlayers: Int {
        case two = 2
        case three = 3
        case four = 4
    }
    private var dealer: Dealer
    var players = [Player]()
    private var gameType: GameType
    private var resumable: Bool {
        dealer.deckCount > (players.count) * gameType.rawValue
    }
    
    init(gameType: GameType, numberOfPlayers: NumberOfPlayers) {
        self.gameType = gameType
        self.dealer = Dealer()
        for _ in 1...numberOfPlayers.rawValue {
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
        while resumable {
            players.forEach {
                $0.discard()
            }
            dealer.shuffle()
            for _ in 1...gameType.rawValue {
                distributeCards()
            }
        }
    }
}
