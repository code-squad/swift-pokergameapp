//
//  GameOperator.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/18.
//

import Foundation

class GameOperator {
    
    var gameOperator = Dealer()
    
    public func startGame() {
        gameOperator.makeDeckForGame()
        gameOperator.distributeCard()
    }
    
}
