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
        
        func repeatByRule(_ block: () -> ()) {
            (0..<rawValue).forEach { _ in block() }
        }
    }
    
    private var cardDeck = CardDeck()
    private let dealer = Participant()
    
    private let rule: Rule
    private let players: Players
    
    init(rule: Rule, numberOfPlayers: Players.Number) {
        self.rule = rule
        self.players = Players(with: numberOfPlayers)
    }
    
    func deal() {
        rule.repeatByRule {
            players.everyPlayers { $0.take(card: cardDeck.removeOne()) }
            dealer.take(card: cardDeck.removeOne())
        }
    }
    
    func table() -> [[Card]] {
        var cards = players.everyPlayers { $0.everyCard { $0 } }
        cards.append(dealer.everyCard { $0 })
        return cards
    }
}

class Players {
    enum Number: Int {
        case two = 2
        case three = 3
        case four = 4

        func repeatForPlayers<T>(_ block: () -> T) -> [T] {
            return (0..<rawValue).map { _ in block() }
        }
    }
    
    private let players: [Participant]
    
    init(with number: Number) {
        self.players = number.repeatForPlayers { Participant() }
    }
    
    @discardableResult
    func everyPlayers<T>(_ transform: (Participant) -> T) -> [T] {
        return players.map { transform($0) }
    }
}

class Participant {
    private var cards = [Card]()
    
    func take(card: Card) {
        cards.append(card)
    }
    
    @discardableResult
    func everyCard<T>(_ transform: (Card) -> T) -> [T] {
        return cards.map { transform($0) }
    }
}

extension Participant: Equatable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.cards == rhs.cards
    }
}
