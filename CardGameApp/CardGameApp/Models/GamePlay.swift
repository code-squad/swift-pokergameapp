//
//  GamePlay.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/10.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class GamePlay {
    enum Rule: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
    }

    enum NumberOfPlayers: Int {
        case two = 2
        case three = 3
        case four = 4
    }
    
    private let rule: Rule
    private let numberOfPlayers: NumberOfPlayers
    private var cardDeck = CardDeck()
    
    let dealer = Participant()
    let players: [Participant]
    
    init(rule: Rule, numberOfPlayers: NumberOfPlayers) {
        self.rule = rule
        self.numberOfPlayers = numberOfPlayers
        self.players = (0..<numberOfPlayers.rawValue).map { _ in Participant() }
    }
    
    func deal() {
        for _ in 0..<rule.rawValue {
            for player in 0..<players.count {
                players[player].cards.append(cardDeck.removeOne())
            }
            dealer.cards.append(cardDeck.removeOne())
        }
    }
}

class Participant {
    var cards = [Card]()
}
