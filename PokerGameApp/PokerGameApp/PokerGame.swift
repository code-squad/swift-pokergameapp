//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/16.
//

import Foundation

class PokerGame {
    enum Rule: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    
    enum NumberOfPlayers: Int {
        case one = 1, two, three, four
    }
    
    private(set) var rule: Rule
    private(set) var players: Players
    private(set) var numberOfPlayers: NumberOfPlayers
    
    init(rule: Rule, players: Players) {
        self.rule = rule
        self.players = players
        self.numberOfPlayers = NumberOfPlayers(rawValue: players.count) ?? .one
    }
    
    func play() {
        players.setHandCard(rule: rule)
    }
    
    func reset() {
        players.reset()
    }
}

