//
//  PokerGame.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class PokerGame {
    var dealer = Dealer()
    var players = [Player]()
    var numberOfPlayers: Int
    var gameType: Int
    var resumable: Bool {
        dealer.deck.count > (players.count) * gameType
    }
    
    init(gameType: Int, numberOfPlayers: Int) {
        self.gameType = gameType
        self.numberOfPlayers = numberOfPlayers
    }
    
    func addPlayers() {
        for _ in 1...numberOfPlayers {
            players.append(Player())
        }
        players.append(dealer)
    }
    
    func distributeCards() {
        players.forEach {
            dealer.drawCard()
            guard let drawnCard = dealer.drawnCard else {
                return
            }
            $0.hand.append(drawnCard)
        }
    }
    
    func initHand() {
        players.forEach {
            $0.initHand()
        }
    }
    
    func play() {
        initHand()
        dealer.shuffle()
        for _ in 1...gameType {
            distributeCards()
        }
    }
    
    func run() {
        addPlayers()
        while resumable {
            play()
        }
    }
}
