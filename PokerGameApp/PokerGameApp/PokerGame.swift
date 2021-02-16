//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

class PokerGame {
    enum Mode: Int {
        case sevenStud = 1, fiveStud
    }
    
    enum NumberOfcards {
        static let seven = 7
        static let five = 5
    }
    
    class func start(gameMode: PokerGame.Mode, NumberOfPlayer: Int) {
        let cardNumber = gameMode == .fiveStud ? NumberOfcards.five : NumberOfcards.seven
        var dealer: Dealer = Dealer(cardDeck: CardDeck())
        var players: [Player] = []
    }
}
