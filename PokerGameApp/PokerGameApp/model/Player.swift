//
//  Players.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/19.
//

import Foundation

class Player {
    private var hand : Deck
    
    init() {
        self.hand = Deck.init()
    }
    
    func showHand() -> String {
        return hand.allCards()
    }
    
    func receiveCard(with newCard : PlayingCard) {
        self.hand.addingNewCard(with: newCard)
    }
}
