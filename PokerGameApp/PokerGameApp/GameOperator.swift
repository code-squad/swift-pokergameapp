//
//  GameOperator.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/18.
//

import Foundation

class GameOperator {
    
    var gameOperator = Dealer()
    var gameBoard = [[String]]()
    
    public func startGame(playersNum: Int, cardStud: Int) {
        gameOperator.makeDeckForGame()
        gameOperator.distributeCard(playersNum: playersNum, cardStud: cardStud)
        gameOperator.receiveHandFromPlayers()
    }
    
    public func checkBoard() {
        gameBoard = gameOperator.hands
    }
    
    public func resetDeck() {
        gameOperator.resetDeck()
    }
    
}
