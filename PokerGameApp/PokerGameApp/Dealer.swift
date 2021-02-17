//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class Dealer: Player {
    
    var cardDeck: CardDeck
    
    override init() {
        cardDeck = CardDeck()
        super.init()
    }
    
    func deal(to player: Player) {
        if let card = cardDeck.removeOne() {
            player.cards.append(card)
        }
    }
    
    func deal(to players: [Player]) {
        players.forEach { deal(to: $0) }
    }
}
