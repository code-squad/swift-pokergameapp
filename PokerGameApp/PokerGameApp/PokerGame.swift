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
        case two = 2, three, four
    }
    
    private(set) var rule: Rule
    private(set) var players: Players
    private(set) var numberOfPlayers: NumberOfPlayers
    
    init(rule: Rule, count: Int) {
        self.rule = rule
        self.numberOfPlayers = NumberOfPlayers(rawValue: count) ?? .two
        self.players = Players(count: count)
    }

    func play() throws {
        try players.setHandCard(rule: rule)
    }
    
    func reset() {
        players.reset()
    }
}

