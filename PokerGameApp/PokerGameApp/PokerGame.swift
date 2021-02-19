//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/18.
//

import Foundation

class PokerGame {
    
    enum GameType: Int {
        case seven = 7
        case five = 5
        
        var value: Int {
            return self.rawValue
        }
    }

    enum PlayerNumber: Int {
        case one = 1, two, three, four
        
        var value: Int {
            return self.rawValue
        }
    }
    
    private var dealer = Dealer()
    private var players = Players()
    private var gameType: GameType
    private var isEndGame: Bool
    
    init(playerNumber: PlayerNumber, gameType: GameType) {
        self.gameType = gameType
        self.isEndGame = false
        players.takeSeat(with: playerNumber)
    }

    public func startGame() {
        while !isEndGame {
            dealer.distributeCard(players, numberOfCards: gameType)
            isEndGame = dealer.judgeEndGame(numberOfPlayers: players, numberOfCards: gameType)
            
            players.printAllCard()
            dealer.showCards()
            players.dropAllCard()
            dealer.dropMyCards()
        }
        print("게임이 종료되었습니다.")
    }
}
