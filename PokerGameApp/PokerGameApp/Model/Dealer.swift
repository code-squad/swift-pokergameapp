//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/19.
//

import Foundation

class Dealer {
    private let cardNum: Int
    private var round: Int
    private var cardDeck: CardDeck
    private(set) var myCard: [Card]
    
    init(cardNum: Int) {
        self.cardNum = cardNum
        self.round = 0
        self.cardDeck = CardDeck()
        cardDeck.shuffle()
        self.myCard = []
    }
    // dealer should shuffle card (OK)
    
    func deal() -> [Card] {
        switch (cardNum, round) {
        case (5, 1):
            return [dealOneCard(face: .down), dealOneCard(face: .up)]
        case (7, 1):
            return [dealOneCard(face: .down), dealOneCard(face: .down),  dealOneCard(face: .up)]
        case (7, 5):
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
    
    func getCard() {
        round += 1
        myCard += deal()
    }
    
    func openCard() {
        for i in 0..<myCard.count {
            if myCard[i].face == .down {myCard[i].face = Face.up}
        }
    }
}
