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
    private let participant : Int
    private let gameType : Int
    
    init(particpatin : Participant, gameType : GameType) {
        self.participant = particpatin.value
        self.gameType = gameType.value
        players.addPlayer(particpatin: participant)
    }
    
    func startGame() {
        players.drawCard(gameType: gameType)
    }
    
    func showPlayersCard() -> String {
        return players.showPlayerCard()
    }
    
    func resetCard() {
        players.resetCard()
    }
    
    func countCardDeck() -> Bool {
        return players.countCardDeck(gameType : gameType)
    }
}

