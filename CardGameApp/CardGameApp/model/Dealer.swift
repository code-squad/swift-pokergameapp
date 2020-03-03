//
//  Dealer.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/16.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Dealer: Player {
    private var cardDeck: CardDeck
    private var gameRule: GameRule
    
    override init(name: String) {
        self.cardDeck = CardDeck()
        self.gameRule = GameRule()
        super.init(name: name)
    }
    
    func shuffle() {
        self.cardDeck.shuffle()
    }
    
    func drawCard() -> Card {
        return cardDeck.removeOne()
    }
    
    func cardDeckCount() -> Int {
        return self.cardDeck.count()
    }
    
    func judgeWinner(players: Players) -> Player {
        return gameRule.judgePriority(participants: players)
    }
}
