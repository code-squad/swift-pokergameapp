//
//  Player.swift
//  CardGame
//
//  Created by Elena on 30/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Player: GamePlayer {
    private var cards: CardStack
    
    init() {
        self.cards = CardStack(cards: [])
    }
    
    func take(card: Card) {
        cards.add(card)
    }
    
    func showCards() -> String {
        return "\(cards)"
    }
    
    func resetCards() {
        cards.reset()
    }
    
    var name: String {
        return "참가자"
    }
    
    var winnerHand: HandBetting? {
        return self.bestHand
    }
    
    var bestHand: HandBetting? {
        return ScoreCalculator.getRank(cards)
    }

}


