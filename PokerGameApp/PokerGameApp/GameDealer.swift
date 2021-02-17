//
//  Dealer.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/17.
//

import Foundation

class PokerGame {
    private var cardDeck = CardDeck()
    
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
    
}
