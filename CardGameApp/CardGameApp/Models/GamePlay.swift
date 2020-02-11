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
    
    private var cardDeck = CardDeck()
    let dealer = Participant()
    
    private let rule: Rule
    private let players: Players
    
    init(rule: Rule, numberOfPlayers: Players.Number) {
        self.rule = rule
        self.players = Players(withNumber: numberOfPlayers)
    }
}

class Players {
    enum Number: Int {
        case two = 2
        case three = 3
        case four = 4

        func entrance() -> [Participant] {
            return (0..<rawValue).map { _ in Participant() }
        }
    }
    
    private let players: [Participant]
    
    init(withNumber number: Number) {
        self.players = number.entrance()
    }
}

class Participant {
    var cards = [Card]()
}
