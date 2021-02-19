//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

enum GameStyle : Int{
    case sevenCardStud = 7
    case fiveCardStud = 5
}

enum PlayerCount : Int {
    case one = 1, two, three, four
}
public class PokerGame {
    
    private var currentGameStyle : GameStyle
    private var currentPlayerCount : PlayerCount
    private let dealer : Dealer
    private let players : Players
    
    init(howManyHands gameStyle : GameStyle = .fiveCardStud, howManyPlayer playerCount : PlayerCount = .one) {
        self.currentGameStyle = gameStyle
        self.currentPlayerCount = playerCount
        self.dealer = Dealer()
        self.players = Players.init(howManyPlayer: playerCount.rawValue)
    }
    
    func test1() {
        dealer.shuffleDeck()
        dealer.sendStartHand(to: players, howMany: currentGameStyle.rawValue)
        players.printPlayers()
        dealer.printSelf()
    }
    
    func test2() {
        dealer.shuffleDeck()
        dealer.sendStartHand(to: players, howMany: currentGameStyle.rawValue)
        players.printPlayers()
        dealer.printSelf()
    }
    
    func reset(with gameStyle : GameStyle, howMany playerCount : PlayerCount) {
        self.currentGameStyle = gameStyle
        self.currentPlayerCount = playerCount
        self.dealer.resetSelf()
        self.players.resetSelf()
    }
}
