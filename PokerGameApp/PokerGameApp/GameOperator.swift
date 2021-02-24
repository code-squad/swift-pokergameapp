//
//  GameOperator.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/18.
//

import Foundation

class GameOperator {
    
    let gameOperator = Dealer()
    let players = Players()
    let cardDeck = CardDeck()
    
    public var stud = Int()
    public var num = Int()

    public func startGame(playerNum: Int, cardStud: Int) {
        gameOperator.recruitPlayer(playerNum: playerNum)
        gameOperator.makeDeck()
        gameOperator.shuffleDeck()
        gameOperator.distributeCard(playerNum: num, cardStud: stud)
    }
    
    public func resetGame() {
        cardDeck.reset()
        gameOperator.resetPlayer()
    }
    
    public func retrieveInfo() -> [Player] {
        return gameOperator.retrieveInfo()
    }
    
    // Game Default Option
    init() {
        stud = GameOption.CardStud.seven.returnRaw()
        num = GameOption.PlayerNumber.one.returnRaw()
        startGame(playerNum: num, cardStud: stud)
    }
    
}

struct GameOption {
    
    enum CardStud: Int {
        case five = 5, seven = 7
        func returnRaw() -> Int {
            return self.rawValue
        }
    }
    
    enum PlayerNumber: Int {
        case one = 1, two = 2, three = 3, four = 4
        func returnRaw() -> Int {
            return self.rawValue
        }
    }
    
}
