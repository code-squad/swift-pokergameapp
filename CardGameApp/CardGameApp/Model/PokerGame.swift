//
//  PokerGame.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

extension Participant {
    func searchRank(handler: (Rank) -> (Void)) {
        ranks.forEach{ handler($0) }
    }
}

extension Participant: Comparable {
    static func < (lhs: Participant, rhs: Participant) -> Bool {
        var lhsRanks = [Rank]()
        lhs.searchRank {
            lhsRanks.append($0)
        }
        
        var rhsRanks = [Rank]()
        rhs.searchRank {
            rhsRanks.append($0)
        }
        
        let min = lhsRanks.count > rhsRanks.count ? lhsRanks.count : rhsRanks.count
        for index in 0 ..< min {
            if lhsRanks[index].combination != rhsRanks[index].combination {
                return lhsRanks[index].combination < rhsRanks[index].combination
            }
        }
        
        if lhsRanks.count > min {
            return false
        }
        
        if rhsRanks.count > min {
            return true
        }
        
        for index in 0 ..< min {
            if lhsRanks[index].number != rhsRanks[index].number {
                return lhsRanks[index].number < rhsRanks[index].number
            }
        }
        return false
    }
    
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        var lhsRanks = [Rank]()
        lhs.searchRank {
            lhsRanks.append($0)
        }
        
        var rhsRanks = [Rank]()
        rhs.searchRank {
            rhsRanks.append($0)
        }
        
        guard lhsRanks.count == rhsRanks.count else {
            return false
        }
        
        for index in 0 ..< lhsRanks.count {
            guard lhsRanks[index] == rhsRanks[index] else {
                return false
            }
        }
        return true
    }
    
}

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
        determineWinner()
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
    
    private func determineWinner() {
        var rankedParticipants = [Participant]()
        participants.searchParticipants { (participant) -> (Void) in
            rankedParticipants.append(participant)
        }
        rankedParticipants = rankedParticipants.sorted()
        if let participant = rankedParticipants.last {
            participant.setWinner()
        }
    }
    
    func hasEnoughCards() -> Bool {
        return deck.count >= stutCount * participantsCount
    }
    
    private var stutCount: Int {
        var stutCount = 0
        gameStut.forEach {
            stutCount += 1
        }
        return stutCount
    }
    
    private var participantsCount: Int {
        var participantsCount = 0
        participants.forEach {
            participantsCount += 1
        }
        return participantsCount
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

