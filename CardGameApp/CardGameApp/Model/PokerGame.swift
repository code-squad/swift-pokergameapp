//
//  PokerGame.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class PokerGame {
    
    private let participants: Participants
    private let deck: Deck
    let gameStut: GameStut
    let participantsNum: ParticipantsNum
    
    init(gameStut: GameStut , participantsNum: ParticipantsNum, deck: Deck){
        self.gameStut = gameStut
        self.participantsNum = participantsNum
        self.deck = deck
        self.participants = Participants(participantsNum: participantsNum)
    }
    
    func startNewRound() {
        resetParticipantsCards()
        shuffle()
        handOutCards()
    }
    
    private func resetParticipantsCards() {
        participants.searchParticipants {
            $0.reset()
        }
    }
    
    private var generator = ANSI_C_RandomNumberGenerator()
    private func shuffle() {
        deck.shuffle(using: &generator)
    }
    
    private func handOutCards() {
        gameStut.forEach {
            sendToParticipants()
        }
    }
    
    private func sendToParticipants() {
        participants.searchParticipants {
            if let card = deck.removeOne() {
                $0.receive(card: card)
            }
        }
    }
    
    func hasEnoughCards() -> Bool {
        var stutNum = 0
        gameStut.forEach {
            stutNum += 1
        }
        var participantsCount = 0
        participantsNum.forEach {
            participantsCount += 1
        }
        return deck.count >= stutNum * participantsCount
    }
    
}

extension PokerGame {
    func searchDeck(handler: (Deck) -> (Void)) {
        handler(deck)
    }
    
    func searchParticipants(handler: (Participant) -> (Void)) {
        participants.searchParticipants {
            handler($0)
        }
    }
}

