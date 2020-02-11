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
        
        var cardPerParticipant: Int {
            return rawValue
        }
    }
    
    private var cardDeck = CardDeck()
    private let dealer = Participant()
    
    private let rule: Rule
    private let players: Players
    
    init(rule: Rule, numberOfPlayers: Players.Number) {
        self.rule = rule
        self.players = Players(withNumber: numberOfPlayers)
    }
    
    func deal() {
        (0..<rule.cardPerParticipant).forEach { _ in
            players.eachTakesACard { cardDeck.removeOne() }
            dealer.take(card: cardDeck.removeOne())
        }
    }
    
    func table() -> [[Card]] {
        var cards = players.allCards()
        cards.append(dealer.cardsInHand)
        return cards
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
    private var current: Int = 0
    
    init(withNumber number: Number) {
        self.players = number.entrance()
    }
    
    func eachTakesACard(block: () -> Card) {
        players.forEach { $0.take(card: block()) }
    }
    
    func allCards() -> [[Card]] {
        return players.map { $0.cardsInHand }
    }
}

class Participant {
    private var cards = [Card]()
    
    var cardsInHand: [Card] {
        return cards
    }
    
    func take(card: Card) {
        cards.append(card)
    }
}
