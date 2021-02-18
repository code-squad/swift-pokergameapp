//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class Dealer: Player {
    
    private var cardDeck: CardDeck
    
    init(cardDeck: CardDeck) {
        self.cardDeck = cardDeck
        super.init()
    }
    
    func deal() -> Card? {
        guard let card = cardDeck.removeOne() else { return nil}
        return card
    }
    
    func deal(to players: Players) -> [Card?] {
        return (0..<players.count).map { _ in deal() }
    }
    
    func shuffleCardDeck() {
        cardDeck.shuffle()
    }
}
