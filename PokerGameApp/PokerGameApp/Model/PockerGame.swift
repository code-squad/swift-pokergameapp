//
//  PockerGame.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

enum GameType: Int {
    case none = 0
    case five = 5
    case seven = 7
    
    init(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .five
        case 1:
            self = .seven
        default:
            self = .none
        }
    }
    
    var value: Int {
        return self.rawValue
    }
}

enum ParticipantType: Int {
    case none = 0
    case two = 2, three, four
    
    init(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .two
        case 1:
            self = .three
        case 2:
            self = .four
        default :
            self = .none
        }
    }
    
    var value: Int {
        return self.rawValue
    }
}

class PockerGame {
    private var dealer: Dealer
    private var participants: Participants
    private var gameType: GameType
    
    init(participantType: ParticipantType, gameType: GameType) {
        self.gameType = gameType
        dealer = Dealer(name: PlayerType.Dealer)
        participants = Participants(participantType: participantType)
    }
    
    func gameStart() {
        dealer.distributeCard(participants: participants, gameType: self.gameType)
    }
    
    func getDealer() -> Dealer {
        return dealer
    }
    
    func getParticipants() -> Participants {
        return participants
    }
}
