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
        
        func invokePerRule(_ block: () -> ()) {
            (0..<rawValue).forEach { _ in block() }
        }
    }
    
    private let dealer = Participant()
    
    private let rule: Rule
    private let players: Players
    private var cardDeck: CardDeck
    
    init(rule: Rule, numberOfPlayers: Players.Number, cardDeck: CardDeck) {
        self.rule = rule
        self.players = Players(with: numberOfPlayers)
        self.cardDeck = cardDeck
    }
    
    func deal() {
        rule.invokePerRule {
            players.repeatForEachPlayer { $0.take(card: cardDeck.removeOne()) }
            dealer.take(card: cardDeck.removeOne())
        }
    }
    
    func table() -> [[Card]] {
        var cards = players.repeatForEachPlayer { $0.repeatForEachCard { $0 } }
        cards.append(dealer.repeatForEachCard { $0 })
        return cards
    }
}

class Players {
    enum Number: Int {
        case two = 2
        case three = 3
        case four = 4

        func invokePerPlayerCount<T>(_ block: () -> T) -> [T] {
            return (0..<rawValue).map { _ in block() }
        }
    }
    
    private let players: [Participant]
    
    init(with number: Number) {
        self.players = number.invokePerPlayerCount { Participant() }
    }
    
    @discardableResult
    func repeatForEachPlayer<T>(_ transform: (Participant) -> T) -> [T] {
        return players.map { transform($0) }
    }
}

class Participant {
    private var cards = [Card]()
    
    func take(card: Card) {
        cards.append(card)
    }
    
    @discardableResult
    func repeatForEachCard<T>(_ transform: (Card) -> T) -> [T] {
        return cards.map { transform($0) }
    }
}

extension Participant: Equatable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.cards == rhs.cards
    }
}
