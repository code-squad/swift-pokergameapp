//
//  PokerGame.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

protocol PokerGame {
    init(dealer: Dealer, playersCount: Int)
    
    func start()
    func isAllPlayersReady() -> Bool
    func isAllPlayersCardsReady() -> Bool
}

class FiveCardStud: PokerGame {
    private let studNumber: Int = 5
    private let dealer : Dealer
    private var players : [Player] = []
    private let playersCount : Int
    
    required init(dealer: Dealer, playersCount: Int) {
        self.playersCount = playersCount
        self.dealer = dealer
        self.players = {
            for _ in 1 ... playersCount {
                let player = Player(whichcardStud: studNumber)
                self.players.append(player)
            }
            return self.players
        }()
    }
    
    func start() {
        
    }
    
    func isAllPlayersReady() -> Bool {
        return self.players.count == self.playersCount
    }
    
    func isAllPlayersCardsReady() -> Bool {
        var readyCheck = [Bool]()
        for player in self.players{
            readyCheck.append(player.isCardsFull())
        }
        let filteredReadycheck = readyCheck.filter{$0 == false}
        return filteredReadycheck.count == 0
    }
}

class SevenCardStud: PokerGame {
    private let studNumber: Int = 7
    private let dealer : Dealer
    private var players : [Player] = []
    private let playersCount : Int
    
    required init(dealer: Dealer, playersCount: Int) {
        self.dealer = dealer
        self.players = {
            for _ in 1 ... playersCount {
                let player = Player(whichcardStud: studNumber)
                self.players.append(player)
            }
            return self.players
        }()
    }
    
    func start() {
        
    }
    
    func isAllPlayersReady() -> Bool {
        return self.players.count == self.playersCount
    }
    
    func isAllPlayersCardsReady() -> Bool {
        var readyCheck = [Bool]()
        for player in self.players{
            readyCheck.append(player.isCardsFull())
        }
        let filteredReadycheck = readyCheck.filter{$0 == false}
        return filteredReadycheck.count == 0
    }
    
    
    
}
