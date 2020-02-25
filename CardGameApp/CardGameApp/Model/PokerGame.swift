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
    
    enum PlayersNum: Int, CaseIterable {
        case one = 1 , two, three, four
        func forEach(handler: () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
}

extension PokerGame.GameStut: CustomStringConvertible {
    var description: String {
        return String(self.rawValue)
    }
}

extension PokerGame.PlayersNum: CustomStringConvertible {
    var description: String {
        return String(self.rawValue)
    }
}


class PokerGame {
    
    private let participants: Participants
    private let gameStut: GameStut
    private let playersNum: PokerGame.PlayersNum
    private let deck: Deck
    
    init(gameStut: GameStut , playersNum: PokerGame.PlayersNum, deck: Deck){
        self.gameStut = gameStut
        self.playersNum = playersNum
        self.deck = deck
        self.participants = Participants(playersNum: playersNum)
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
        return deck.count >= stutNum * participantsNum
    }
    
    private var stutNum: Int {
        var stutNum = 0
        gameStut.forEach {
            stutNum += 1
        }
        return stutNum
    }
    
    var participantsNum: Int {
        let dealerCount = 1
        return dealerCount + playersNumCount
    }
    
    private var playersNumCount: Int {
        var playersNumCount = 0
        playersNum.forEach {
            playersNumCount += 1
        }
        return playersNumCount
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

