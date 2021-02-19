//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/18.
//

import Foundation

class Dealer {
    private var cards = [Card]()
    private var cardDeck = CardDeck(empty: true)
    
    init() {
        resetCardDeck()
    }
    
    public func resetCardDeck() {
        cardDeck.reset()
        cardDeck.shuffle()
    }
    
    public func distributeCard(_ players: [Player], numberOfCards: GameType) {
        for _ in 0..<numberOfCards.value {
            for index in 0..<players.count {
                if let card = cardDeck.popCard() {
                    players[index].reciveCard(card)
                }
            }
            if let card = cardDeck.popCard() {
                cards.append(card)
            }
        }
    }

    public func judgeEndGame(numberOfPlayers: [Player], numberOfCards: GameType) -> Bool {
        return cardDeck.count < numberOfPlayers.count * numberOfCards.value ? true : false
    }
    
    public func showCards() -> [Card] {
        return cards
    }
    
    public func dropMyCards() {
        cards.removeAll()
    }
}
