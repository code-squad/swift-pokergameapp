//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/18.
//

import Foundation

class Dealer {
    private var cardDeck: CardDeck
    private var cards: [Card]
    private var gameType: GameType
    
    init(gameType: GameType) {
        self.cardDeck = CardDeck(cards: [])
        self.cards = [Card]()
        self.gameType = gameType
    }
    
    func deal(to players: Players) {
        players.distribute(dealer: self)
        self.cards = give()
    }
    
    func give() -> [Card] {
        return cardDeck.give(gameType: gameType)
    }
    
    func printDealerCards() {
        print("딜러 \(cards)")
    }
    
    func readyToStart() {
        cardDeck.filltheCardDeck()
        cardDeck.shuffle()
    }
}
