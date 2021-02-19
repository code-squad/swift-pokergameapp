//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/18.
//

import Foundation

class Dealer: Playable {
    private var cards = [Card]()
    private var cardDeck = CardDeck(empty: true)
    
    init() {
        resetCardDeck()
    }
    
    public func resetCardDeck() {
        cardDeck.reset()
        cardDeck.shuffle()
    }
    
    public func distributeCard(_ players: Players, numberOfCards: PokerGame.GameType) {
        for _ in 0..<numberOfCards.value {
            if let card = cardDeck.popCard() {
                players.reciveCard(card)
            }
            if let card = cardDeck.popCard() {
                cards.append(card)
            }
        }
    }

    public func judgeEndGame(numberOfPlayers: Players, numberOfCards: PokerGame.GameType) -> Bool {
        return cardDeck.count < (numberOfPlayers.count+1) * numberOfCards.value ? true : false
    }
    
    public func showCards() -> [Card] {
        return cards
    }
    
    public func dropMyCards() {
        cards.removeAll()
    }
}
