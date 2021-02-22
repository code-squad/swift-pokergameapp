//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

class PokerGame {
    enum Mode:String, CaseIterable {
        case sevenStud = "7 cards"
        case fiveStud = "5 cards"
    }
    
//    enum NumberOfPalyer: String, CaseIterable {
//        case two = "2명"
//        case three = "3명"
//        case four = "4명"
//    }
    enum NumberOfPalyer: Int, CaseIterable {
        case two = 2, three, four
    }
    
    private var players: Players = Players(players: [])
    
    func start(gameMode: Mode, numberOfPlayer: Int, completion: @escaping (Players) -> Void) {
        let cardCount = gameMode == .fiveStud ? 5 : 7
        players.registerPlayers(numberOfPlayers: numberOfPlayer, cardCount: cardCount)
        
        completion(players)
    }
}
