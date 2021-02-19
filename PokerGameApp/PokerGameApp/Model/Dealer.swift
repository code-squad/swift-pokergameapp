//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/19.
//

import Foundation

class Playable {
    private(set) var cards: [Card]
    
    init() {
        cards = []
    }
    
    func getCard(from cards: [Card]) {
        self.cards += cards
    }
    
    func openCards() {
        for i in 0..<cards.count {
            if cards[i].face == .down {cards[i].face = Face.up}
        }
    }
}

class Dealer: Playable {
    private let cardNum: PokerType
    private var round: Int
    private var cardDeck: CardDeck

    
    init(cardNum: PokerType) {
        self.cardNum = cardNum
        self.round = 0
        self.cardDeck = CardDeck()
        cardDeck.shuffle()
    }
    
    func roundUp() {
        round += 1
    }
    
    func deal() -> [Card] {
        switch (cardNum, round) {
        case (.five, 1):
            return [dealOneCard(face: .down), dealOneCard(face: .up)]
        case (.seven, 1):
            return [dealOneCard(face: .down), dealOneCard(face: .down),  dealOneCard(face: .up)]
        case (.seven, 5):
            return [dealOneCard(face: .down)]
        default:
            return [dealOneCard(face: .up)]
        }
    }

    
    func dealOneCard(face: Face) -> Card {
        var oneCard = cardDeck.takeOutCard()
        oneCard.face = face
        
        return oneCard
    }
}
