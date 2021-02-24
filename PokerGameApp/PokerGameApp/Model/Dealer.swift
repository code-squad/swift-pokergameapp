//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/18.
//

import Foundation

class Dealer: Playable {
    var name: String {
        return "Dealer"
    }
    private var cardDeck: CardDeck
    private var cards: [Card]
    private var gameType: GameType
    
    init(gameType: GameType) {
        self.cardDeck = CardDeck(cards: [])
        self.cards = [Card]()
        self.gameType = gameType
    }
    
    func retrieveCard(completion: (Card) -> Void) {
        cards.forEach { (card) in
            completion(card)
        }
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
    func shuffle() {
        cardDeck.shuffle()
    }
}

protocol Playable {
    var name: String{get}
    func retrieveCard(completion: (Card) -> Void)
}
