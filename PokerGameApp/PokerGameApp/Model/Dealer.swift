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

