//
//  PokerGame.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class PokerGame {
    
    private let deck: Deck
    let gameStut: GameStut
    let participants: Participants
    
    init(gameStut: GameStut , participants: Participants, deck: Deck){
        self.gameStut = gameStut
        self.participants = participants
        self.deck = deck
    }
    
    func startNewRound() {
        resetParticipantsCards()
        shuffle()
        handOutCards()
        updateParticipantRanks()
        participants.determineWinner()
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
    
    private func updateParticipantRanks() {
        participants.searchParticipants { (participant) -> (Void) in
            participant.updateRanks()
        }
    }

    func hasEnoughCards() -> Bool {
        return deck.count >= stutCount * participants.count
    }
    
    private var stutCount: Int {
        var stutCount = 0
        gameStut.forEach {
            stutCount += 1
        }
        return stutCount
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

