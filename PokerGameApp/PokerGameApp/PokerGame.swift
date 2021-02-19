//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/18.
//

import Foundation

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

class PokerGame {
    private var dealer = Dealer()
    private var players = [Player]()
    private var gameType: GameType
    private var isEndGame: Bool
    
    init(playerNumber: PlayerNumber, gameType: GameType) {
        self.gameType = gameType
        self.isEndGame = false
        
        for _ in 0..<playerNumber.value {
            players.append(Player())
        }
    }
    
    private func printAllPeopleCard() {
        for (number, player) in players.enumerated() {
            print("참가자#\(number+1) \(player.showCards())")
        }
        print("딜러 ",dealer.showCards())
    }
    
    private func dropAllpeopleCard() {
        players.forEach { player in
            player.dropMyCards()
        }
        dealer.dropMyCards()
    }
    
    public func startGame() {
        while !isEndGame {
            dealer.distributeCard(players, numberOfCards: gameType)
            isEndGame = dealer.judgeEndGame(numberOfPlayers: players, numberOfCards: gameType)
            
            printAllPeopleCard()
            dropAllpeopleCard()
        }
        print("게임이 종료되었습니다.")
    }
}
