//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

class Dealer: Player {
    private var cardDeck = CardDeck()

    override init(name: PlayerType) {
        super.init(name: name)
    }
    
    func distributeCard(participants: Participants, numOfCard: Int) {
        cardDeck.reset()
        cardDeck.shuffle()
        
        for _ in 1...numOfCard {
            if let selectedCard = cardDeck.removeOn() {
                self.receiveCard(selectedCard)
            } else {
                return
            }
            
            for _ in 0..<participants.count {
                if let selectedCard = cardDeck.removeOn() {
                    participants.receiveCard(selectedCard)
                } else {
                    return
                }
            }
        }
    }
}

