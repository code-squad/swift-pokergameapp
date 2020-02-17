//
//  PokerGame.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

enum GameStut: Int {
    case five = 5, seven = 7
    
    func forEach(handler: () -> ()) {
        for _ in 0 ..< self.rawValue {
            handler()
        }
    }
    
    func forEach(handler: () throws  -> ()) throws {
        for _ in 0 ..< self.rawValue {
            try handler()
        }
    }
}

enum PlayersNum: Int {
    case one = 1 , two, three, four
    func forEach(handler : () -> ()) {
        for _ in 0 ..< self.rawValue {
            handler()
        }
    }
}

class PokerGame {
    
    private let deck = Deck()
    private let dealer = Player()
    private var players: [Player]!
    
    private var gameStut: GameStut
    private var playersNum : PlayersNum
    
    init(gameStut: GameStut , playerNum: PlayersNum){
        self.gameStut = gameStut
        self.playersNum = playerNum
        players = initPlayers(num: self.playersNum)
    }
    
    private func initPlayers(num: PlayersNum) -> [Player] {
        var players = [Player]()
        num.forEach {
            players.append(Player())
        }
        return players
    }
    
    func startNewRound() throws {
        initParticipantsCards()
        shuffle()
        try handOutCards()
    }
    
    private func initParticipantsCards() {
        initDealerCards()
        initPlayersCards()
    }
    
    private func initDealerCards() {
        dealer.initCards()
    }
    
    private func initPlayersCards() {
        _ = players.map { $0.initCards() }
    }
    
    private var generator = ANSI_C_RandomNumberGenerator()
    private func shuffle() {
        deck.shuffle(using: &generator)
    }
    
    private func handOutCards() throws {
        try gameStut.forEach {
            try sendToDealer()
            try sendToPlayers()
        }
    }
    
    private func sendToDealer() throws {
        try dealer.receiveCard {
            try deck.removeOne()
        }
    }
    
    private func sendToPlayers() throws {
        for index in 0 ..< players.count {
            try players[index].receiveCard {
                try deck.removeOne()
            }
        }
    }
    
    func hasEnoughCards() -> Bool {
        return deck.count >= stutNum * players.count
    }
    
    private var stutNum : Int {
        var stutNum = 0
        gameStut.forEach {
            stutNum += 1
        }
        return stutNum
    }
}

extension PokerGame {
    func searchDeck(handler: (Deck) -> ()) {
        handler(deck)
    }
    
    func searchDealer(handler : (Player) -> ()) {
        handler(dealer)
    }
    
    func searchPlayers(handler : (Player) -> ()) {
        for player in players {
            handler(player)
        }
    }
    
}

enum PokerGameError: Error {
    case invalidGameStutNumber
    case invalidPlayersNumber
}
