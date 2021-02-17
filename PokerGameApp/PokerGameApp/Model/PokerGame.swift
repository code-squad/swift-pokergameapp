//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/17.
//

import Foundation

class PokerGame {
    private var cardDeck: CardDeck
    private var players: [Player]
    private var dealer: Dealer = Dealer()
    
    init(cardDeck: CardDeck = CardDeck(cards: []), players: [Player] = []) {
        self.cardDeck = cardDeck
        self.players = players
    }
    
    func startGame() {
        cardDeck.filltheCardDeck()
        cardDeck.shuffle()
    }
    
    class Player {
        var playerCards: [Card] = []
    }
    class Dealer {
        var dealerCards: [Card] = []
        
    }
    
    class SevenCardStud {
        
    }
    class FiveCardStud {
        
    }
}
