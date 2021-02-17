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
    
    private var rule: Rule
    private var players: Players
    private var numberOfPlayers: NumberOfPlayers
    
    init(rule: Rule = .sevenCardStud, players: Players) {
        self.rule = rule
        self.players = players
        self.numberOfPlayers = NumberOfPlayers(rawValue: players.count) ?? .one
        //cardDeck.shuffle()
    }
    
    func play() {
        // 카드 돌리기
        players.setHandCard(rule: rule)
    }
    
    func reset() {
        // 카드 리셋
    }
}

