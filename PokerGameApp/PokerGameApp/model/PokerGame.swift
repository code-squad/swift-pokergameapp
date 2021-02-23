//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

enum GameStyle : Int, CustomStringConvertible {
    var description: String {
        return "\(self.rawValue) Card"
    }
    
    case sevenCardStud = 7
    case fiveCardStud = 5
    
    static var gameTypes: [String] {
        return [self.sevenCardStud.description, self.fiveCardStud.description]
    }
}

enum PlayerCount : Int, CustomStringConvertible, CaseIterable {
    var description: String {
        return "\(self.rawValue)명"
    }
    case one = 1, two, three, four
    
    static var availablePlayerCount : [String] {
        return self.allCases.map({
            $0.description
        })
    }
}
public class PokerGame {
    
    private var currentGameStyle : GameStyle
    private var currentPlayerCount : PlayerCount
    private let dealer : Dealer
    private var players : Players
    
    init(howManyHands gameStyle : GameStyle = .fiveCardStud, howManyPlayer playerCount : PlayerCount = .one) {
        self.currentGameStyle = gameStyle
        self.currentPlayerCount = playerCount
        self.dealer = Dealer()
        self.players = Players.init(howManyPlayer: playerCount.rawValue)
    }
    
    /// if fail, return false
    func start() -> Bool {
        dealer.shuffleDeck()
        if dealer.sendStartHand(to: players, howMany: currentGameStyle.rawValue) == false {
            return false
        }
        return true
    }
    
    func reset(with gameStyle : GameStyle? = nil, howMany playerCount : PlayerCount? = nil) {
        if gameStyle != nil {
            self.currentGameStyle = gameStyle!
        }
        
        if playerCount != nil {
            self.currentPlayerCount = playerCount!
        }
        
        self.dealer.resetSelf()
        self.players = Players.init(howManyPlayer: currentPlayerCount.rawValue)
    }
    
    func resetDeck() {
        self.dealer.newDeck()
    }
    
    func showParticipatnsInfo(do closure : ((Deck,String)->Void)) {
        players.showInfo(do : closure)
        dealer.showInfo(do : closure)
    }
}
