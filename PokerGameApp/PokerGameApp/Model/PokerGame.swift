//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

enum GameType : Int, CustomStringConvertible {
    case seven = 7
    case five = 5
    
    var description: String {
        return "\(self.rawValue) card"
    }
    
    var value : Int {
        return self.rawValue
    }
    static var allValues: [GameType] {
        return [.seven,.five]
    }
    
    static var gameTypeItem : [String] {
        return [self.seven.description,self.five.description]
    }
    
}

enum Participant : Int, CustomStringConvertible {
    case one = 1
    case two
    case three
    case four
    
    var description: String {
        return "\(self.rawValue) 명"
    }
    
    var value: Int {
        return self.rawValue
    }
    static var allValues: [Participant] {
        return [.one,.two,.three,.four]
    }
    
    static var participantItem : [String] {
        return [self.one.description,self.two.description,
                self.three.description,self.four.description]
    }
}

class PockerGame {
    private var players = Players()
    private var participant : Int
    private var gameType : Int
    
    init(){
        self.gameType = 0
        self.participant = 0
    }
    
    func startGame() {
        players.addPlayer(particpatin: self.participant)
    }
    
    func drawCard() {
        players.drawCard(gameType: self.gameType)
    }
    
    func setGame(gameType : Int, participant : Int) {
        self.gameType = gameType
        self.participant = participant
    }
    
    func resetPlayer() {
        players.resetPlayer()
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

