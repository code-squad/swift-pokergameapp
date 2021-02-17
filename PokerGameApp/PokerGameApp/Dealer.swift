//
//  Dealer.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

class Dealer : Playable {
    private var cardDeck = CardDeck()
    private var deck = Deck()
    private let name = "딜러"
    
    init() {
        cardDeck.shuffle()
    }
    
    func receiveCard(card: Card) {
        deck.receiveCard(card: card)
    }
    
    func resetCards() {
        deck.resetCard()
    }
    
    func receiveCard(gameType : Int, players : [Playable]) {
        players.forEach { player in
            (1...gameType).forEach { _ in
                guard let card = cardDeck.removeOne() else {
                    return
                }
                player.receiveCard(card: card)
            }
        }
    }
    
    func showCards() -> String {
        return "\(name) \(self.deck.showCards())"
    }
    
    func resetPlayerCard(players : [Playable]) {
        players.forEach { player in
            player.resetCards()
        }
    }
}
