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
    
    private var rule: Rule
    private var cardDeck = CardDeck()
    private var players: [Player] = []
    
    init(rule: Rule = .sevenCardStud, players: [Player]) {
        self.rule = rule
        self.players = players
        cardDeck.shuffle()
    }
    
    // 카드 딜링
    func splitCard() {
        for _ in 0..<rule.rawValue {
            for player in players {
                if let card = cardDeck.removeOne() {
                    player.receive(card: card)
                }
            }
        }
    }
    
    func reset() {
        for player in players {
            player.reset()
        }
    }
}

class Player {
    enum PlayerType {
        case dealer
        case player
    }
    
    private var handCard: [Card] = []
    var playerType: PlayerType
    var getHandCard: [Card] {
        return handCard
    }
    
    init(playerType: PlayerType = .player) {
        self.playerType = playerType
    }
    
    func receive(card: Card) {
        handCard.append(card)
    }
    
    func reset() {
        handCard.removeAll()
    }
}
