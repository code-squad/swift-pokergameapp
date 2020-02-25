//
//  PokerGame.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation
extension PokerGame {
    
    enum GameStut: Int, CaseIterable {
        case seven = 7, five = 5
        
        func forEach(handler: () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
    
    struct ParticipantsNum {
        enum PlayersNum: Int, CaseIterable {
            case one = 1 , two, three, four
            func forEach(handler: () -> (Void)) {
                for _ in 0 ..< self.rawValue {
                    handler()
                }
            }
        }
        let playersNum: PlayersNum
        static let dealerCount = 1
    }
}

extension PokerGame.ParticipantsNum.PlayersNum: Comparable {
    static func < (lhs: PokerGame.ParticipantsNum.PlayersNum, rhs: PokerGame.ParticipantsNum.PlayersNum) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension PokerGame.ParticipantsNum {
    static func forEachMaxCase(handler : () -> (Void)) {
        if let max = PokerGame.ParticipantsNum.PlayersNum.allCases.max() {
            let maxCount = max.rawValue + PokerGame.ParticipantsNum.dealerCount
            for _ in 0 ..< maxCount {
                handler()
            }
        }
    }
    
    func forEach(handler : () -> (Void)) {
        let participantsNum = playersNum.rawValue +
            PokerGame.ParticipantsNum.dealerCount
        for _ in 0 ..< participantsNum {
            handler()
        }
    }
}

extension PokerGame.GameStut: CustomStringConvertible {
    var description: String {
        return String(self.rawValue)
    }
}

extension PokerGame.ParticipantsNum.PlayersNum: CustomStringConvertible {
    var description: String {
        return String(self.rawValue)
    }
}


class PokerGame {
    
    private let participants: Participants
    private let deck: Deck
    let gameStut: GameStut
    let participantsNum: PokerGame.ParticipantsNum
    
    init(gameStut: GameStut , participantsNum: PokerGame.ParticipantsNum, deck: Deck){
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

