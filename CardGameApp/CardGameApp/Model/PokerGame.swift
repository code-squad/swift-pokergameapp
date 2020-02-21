//
//  PokerGame.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation
extension PokerGame {
    enum GameStut: Int, CaseIterable {
        case five = 5, seven = 7
        
        func forEach(handler: () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
}

extension PokerGame.GameStut: CustomStringConvertible {
    var description: String {
        switch self {
        case .five:
            return "5 Cards"
        case .seven:
            return "7 Cards"
        }
    }
}

class PokerGame {
    
    private let deck = Deck()
    private let dealer = Player()
    private let players: Players
    private let gameStut: GameStut
    
    var stutNum: Int {
        var stutNum = 0
        gameStut.forEach {
            stutNum += 1
            
        }
        return stutNum
    }
    
    var participantsNum:Int {
        let dealerCount = 1
        return dealerCount + playersNum
    }
    
    private var playersNum: Int {
        var playersNumCount = 0
        players.searchPlayersNum { (playersNum: Players.PlayersNum) in
            playersNum.forEach {
                playersNumCount += 1
            }
        }
        return playersNumCount
    }
    
    init(gameStut: GameStut , playersNum: Players.PlayersNum){
        self.gameStut = gameStut
        self.players = Players(playersNum: playersNum)
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
        players.searchPlayer { (player: Player) -> (Void) in
            player.reset()
        }
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
        players.searchPlayer { (player: Player) in
            if let card = deck.removeOne() {
                player.receive(card: card)
            }
        }
    }
    
    func hasEnoughCards() -> Bool {
        return deck.count >= stutNum * playersNum
    }
}

extension PokerGame {
    func searchDeck(handler: (Deck) -> ()) {
        handler(deck)
    }
    
    func searchDealer(handler: (Player) -> ()) {
        handler(dealer)
    }
    
    func searchPlayers(handler: (Player) -> ()) {
        players.searchPlayer {
            handler($0)
        }
    }
}

