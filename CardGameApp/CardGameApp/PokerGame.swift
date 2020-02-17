//
//  PokerGame.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

protocol PokerGame {
    init(dealer: Dealer, playersCount: Int, studNumber: Int)
    
    func start()
    func isAllPlayersReady() -> Bool
    func isAllPlayersCardsReady() -> Bool
}

enum GameMode : Int,CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)"
    }
    case fiveCardStud = 5
    case sevenCardStud = 7
}

class CardStud: PokerGame {
    private let studNumber: Int
    private let dealer : Dealer
    private var players : [Player] = []
    private let playersCount : Int
    
    required init(dealer: Dealer, playersCount: Int, studNumber: Int) {
        self.studNumber = studNumber
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
        self.dealer.addCard(newCard: self.dealer.distributeCards())
        self.players.forEach{$0.addCard(newCard: self.dealer.distributeCards())}
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

