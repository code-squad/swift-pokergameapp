//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class Dealer: Participant {
    private(set) var nickname: String
    private var cards: [Card]
    private var cardDeck: CardDeck
    
    init(cardDeck: CardDeck) {
        self.nickname = "Dealer"
        self.cards = []
        self.cardDeck = cardDeck
    }
    
    func dealt(_ card: Card) {
        self.cards.append(card)
    }
    
    func cardsCount() -> Int {
        cards.count
    }
    
    func tellCard(at index: Int) -> Card {
        return cards[index]
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
