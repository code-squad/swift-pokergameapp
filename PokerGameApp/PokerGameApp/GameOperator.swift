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
    
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    public func startGame() {
=======
    public func startGame(playersNum: Int, cardStud: Int) {
>>>>>>> d8caa9f8... 게임 진행을 위한 함수를 구현했습니다.
=======
    public func startGame(playersNum: Int, cardStud: Int) {
>>>>>>> d8caa9f8... 게임 진행을 위한 함수를 구현했습니다.
=======
    public func startGame(playersNum: Int, cardStud: Int) {
>>>>>>> bb7e5f81... 게임 진행을 위한 함수를 구현했습니다.
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
