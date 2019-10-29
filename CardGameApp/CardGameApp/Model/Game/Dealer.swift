//
//  Dealer.swift
//  CardGame
//
//  Created by Elena on 30/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Dealer{
    private var deck: CardDeck
    private var cards: CardStack
    
    init(_ deck: CardDeck) {
        self.deck = deck
        self.cards = CardStack(cards: [])
    }
    
    func removeDeal() -> Card? {
        guard let card = deck.removeOne() else { return nil }
        return card
    }
    
    func enoughCards(player number: Int,modeCardNumber gameMode: GameMode) -> Bool {
        return deck.count() >= number * gameMode.modeCardNumber
    }
}

extension Dealer: GamePlayer {
    
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
        return "딜러"
    }
    
    var winnerHand: HandBetting? {
        return self.bestHand
    }
    
    var bestHand: HandBetting? {
        return ScoreCalculator.getRank(cards)
    }
}
