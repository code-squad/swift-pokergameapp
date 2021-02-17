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
    private var dealer = Dealer()
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
                    player.receiveCard(card: card)
                }
            }
            if let card = cardDeck.removeOne() {
                dealer.receiveCard(card: card)
            }
        }
    }
}

// Dealer와 Player의 중복되는 코드
class Dealer {
    private var handCard: [Card] = []
    
    var getHandCard: [Card] {
        return handCard
    }
    
    func receiveCard(card: Card) {
        handCard.append(card)
    }
}

class Player {
    private var handCard: [Card] = []
    
    var getHandCard: [Card] {
        return handCard
    }
    
    func receiveCard(card: Card) {
        handCard.append(card)
    }
}
