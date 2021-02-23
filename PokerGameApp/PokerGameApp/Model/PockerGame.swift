//
//  PockerGame.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

enum GameType: Int, CaseIterable, CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)Cards"
    }
    
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
    
    static var allItems: [String] {
        return GameType.allCases.filter({ $0 != .none}).map({$0.description})
    }
}

enum ParticipantType: Int, CaseIterable, CustomStringConvertible {
    
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
    
    var description: String {
        return "\(self.rawValue)명"
    }
    
    static var allItems: [String] {
        return ParticipantType.allCases.filter({$0 != .none}).map{$0.description}
    }
}

class PockerGame {
    private var dealer: Dealer
    private var participants: Participants
    private var gameType: GameType
    private var participantType: ParticipantType
    
    init(participantType: ParticipantType, gameType: GameType) {
        self.gameType = gameType
        self.participantType = participantType
        dealer = Dealer(name: PlayerType.Dealer)
        participants = Participants(participantType: participantType)
    }
    
    func setGameType(gameType: GameType) {
        self.gameType = gameType
    }
    
    func setParticipantType(participantType: ParticipantType) {
        self.participantType = participantType
    }
    
    func gameStart() {
        dealer.distributeCard(participants: participants, participantType: self.participantType, gameType: self.gameType)
    }
    
    func getDealer() -> Dealer {
        return dealer
    }
    
    func getParticipants() -> Participants {
        return participants
    }
}
