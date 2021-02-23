//
//  PockerGame.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

enum GameType: Int, CaseIterable, CustomStringConvertible {

    case five = 5
    case seven = 7
    
    init(rawValue: Int) {
        self = GameType.allCases[rawValue]
    }
    
    var description: String {
        return "\(self.rawValue)Cards"
    }
    
    static var allItems: [String] {
        return GameType.allCases.map({$0.description})
    }
}

enum ParticipantType: Int, CaseIterable, CustomStringConvertible {
    
    case two = 2, three, four
    
    init(rawValue: Int) {
        self = ParticipantType.allCases[rawValue]
    }
    
    var description: String {
        return "\(self.rawValue)명"
    }
    
    static var allItems: [String] {
        return ParticipantType.allCases.map{$0.description}
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
