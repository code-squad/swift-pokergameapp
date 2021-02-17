//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/17.
//

import Foundation

class PokerGame {
    var cardDeck: CardDeck
    var players: [Player]
    var dealer: Dealer = Dealer()
    
    init(cardDeck: CardDeck = CardDeck(cards: []), players: [Player] = []) {
        self.cardDeck = cardDeck
        self.players = players
    }
    
    func readyToGameStart() {
        cardDeck.filltheCardDeck()
    }
    func participate() {
    }
    
    class Player {
        var playerCards: [Card] = []
    }
    class Dealer {
        var dealerCards: [Card] = []
    }
}
