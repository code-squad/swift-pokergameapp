//
//  Game.swift
//  CardGameApp
//
//  Created by Viet on 2020/02/11.
//  Copyright © 2020 Viet. All rights reserved.
//

import Foundation

// 플레이어는 1~4명
struct Game {
    enum Rule {
        case fiveStud, sevenStud
    }

    let playerRange = 1...4
    let rule: Rule
    let dealer: Dealer
    let players: [Playable]
    
    init(rule: Rule, players: [Playable]) throws {
        guard playerRange.contains(players.count) else {
            throw GameError.playersOutOfRange
        }
        
        self.players = players
        self.rule = rule
        
        let deck = CardGameFactory.createDeck()
        self.dealer = Dealer(deck: deck)
    }
    
    func start() {
        dealer.startGame(rule: rule, players: players)
    }
}

enum GameError: Error {
    case playersOutOfRange
}

struct CardGameFactory {
    static func createDeck() -> Deck {
        return Deck(cards: createAllCards())
    }
    
    static func createAllCards() -> [Card] {
        return Card.Suit.allCases.flatMap {
            createCards(per: $0)
        }
    }
    
    static func createPlayers(count: Int) throws -> [Player] {
        guard count >= 1 else {
            throw GameError.playersOutOfRange
        }
        return (1...count).map { _ in Player() }
    }
    
    private static func createCards(per suit: Card.Suit) -> [Card] {
        return Card.Rank.allCases.map {
            Card(suit: suit, rank: $0)
        }
    }
}
