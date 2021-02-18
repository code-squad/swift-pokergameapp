//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

enum GameType : Int {
    case seven = 7
    case five = 5
    
    var value : Int {
        return self.rawValue
    }
}

enum Participant : Int {
    case one = 1
    case two
    case three
    case four
    
    var value: Int {
        return self.rawValue
    }
}

class PockerGame {
    private var players = Players()
    private var participant : Int = 0
    private var gameType : Int = 0
    
    func startGame(particpatin : Participant, gameType : GameType) {
        self.participant = particpatin.value
        self.gameType = gameType.value
        players.addPlayer(particpatin: self.participant)
        players.drawCard(gameType: self.gameType)
    }
    
    func showPlayersCard() -> [PlayerCard] {
        return players.showPlayerCard()
    }
    
    func resetCard() {
        players.resetCard()
    }
    
    func countCardDeck() -> Bool {
        return players.countCardDeck(gameType : gameType)
    }
}

