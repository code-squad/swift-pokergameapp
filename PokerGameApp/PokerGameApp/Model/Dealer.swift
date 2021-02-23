//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

class Dealer: Player {

    private var cardDeck = CardDeck()
    private var name: String
    private var cards: [Card] = []
    
    init() {
        name = "딜러"
    }
    
    func receiveCard(_ card: Card) {
        cards.append(card)
    }
    
    func eachCard(method: (Card) -> ()) {
        cards.forEach{method($0)}
    }
    
    func resetCard() {
        cards.removeAll()
    }
    
    func distributeCard(participants: Participants, participantType: ParticipantType, gameType: GameType) {
        
        cardDeck.reset()
        cardDeck.shuffle()
        
        self.resetCard()
        participants.resetParticipant(participantType)
        
        for _ in 1...gameType.rawValue {
            if let selectedCard = cardDeck.removeOn() {
                self.receiveCard(selectedCard)
            } else {
                return
            }
            participants.eachParticipant(method: { (num, participant) in
                if let selectedCard = cardDeck.removeOn() {
                    participant.receiveCard(selectedCard)
                } else {
                    return
                }
            })
        }
    }
}

