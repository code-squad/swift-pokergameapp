//
//  PokerGame.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation
extension PokerGame {
    enum GameStut: Int {
        case five = 5, seven = 7
        
        func forEach(handler : () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
    
    enum PlayersNum: Int {
        case one = 1 , two, three, four
        func forEach(handler : () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
}

class PokerGame {
    
    private let deck = Deck()
    private let dealer = Player()
    private var players: [Player]!
    
    private var gameStut: GameStut
    private var playersNum : PlayersNum
    
    init(gameStut: GameStut , playersNum: PlayersNum){
        self.gameStut = gameStut
        self.playersNum = playersNum
        players = initPlayers(num: self.playersNum)
    }
    
    private func initPlayers(num: PlayersNum) -> [Player] {
        var players = [Player]()
        num.forEach {
            players.append(Player())
        }
        return players
    }
    
    func startNewRound() {
        resetParticipantsCards()
        shuffle()
        handOutCards()
    }
    
    private func resetParticipantsCards() {
        resetDealerCards()
        resetPlayersCards()
    }
    
    private func resetDealerCards() {
        dealer.reset()
    }
    
    private func resetPlayersCards() {
        players.forEach{ $0.reset() }
    }
    
    private var generator = ANSI_C_RandomNumberGenerator()
    private func shuffle() {
        deck.shuffle(using: &generator)
    }
    
    private func handOutCards() {
        gameStut.forEach {
            sendToDealer()
            sendToPlayers()
        }
    }
    
    private func sendToDealer() {
        if let card = deck.removeOne() {
            dealer.receive(card: card)
        }
    }
    
    private func sendToPlayers() {
        for index in 0 ..< players.count {
            if let card = deck.removeOne() {
                players[index].receive(card: card)
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

