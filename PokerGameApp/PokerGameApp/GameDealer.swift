//
//  Dealer.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/17.
//

import Foundation

class PokerGame {
    private var cardDeck = CardDeck()
    private var players: [[Card]] = [[]]
    
    enum Player: Int {
        case one = 1, two, three, four
    }
    enum Rule: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    let player: Player, rule: Rule
    
    init(player: Player, rule: Rule) {
        self.player = player
        self.rule = rule
        cardDeck.makeCardDeck()
        cardDeck.shuffle()
    }
    
    func handoutCards() {
        for player in 0..<players.count {
            for _ in 0..<rule.rawValue {
                players[player].append(cardDeck.removeOne()!)
            }
        }
    }
    
    func makePlayer() {
        for _ in 0..<player.rawValue {
            let player: [Card] = []
            players.append(player)
        }
    }
    
    func start() {
        makePlayer()
        handoutCards()
        print("\(rule.rawValue)카드 기준, 참가자 \(player.rawValue)일 때")
        for i in 0..<players.count - 1 {
            print("player\(i+1): \(players[i])")
        }
        print("dealer: \(players[players.count - 1])")
    }
}

