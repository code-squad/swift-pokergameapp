//
//  PockerGame.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

enum GameType: Int {
    case five = 5
    case seven = 7
    
    var value: Int {
        return self.rawValue
    }
}

enum ParticipantType: Int {
    case one = 1, two, three, four
    
    var value: Int {
        return self.rawValue
    }
}

class PockerGame {
    private var dealer: Dealer
    private var participants: Participants
    private var numOfCard: Int
    
    init(number ofParticipant: ParticipantType, number ofCard: GameType) {
        self.numOfCard = ofCard.value
        dealer = Dealer(name: PlayerType.Dealer)
        participants = Participants(number: ofParticipant.value)
    }
    
    func gameStart() {
        dealer.distributeCard(participants: participants, numOfCard: self.numOfCard)
    }
    
    func getDealer() -> Dealer {
        return dealer
    }
    
    func getParticipants() -> Participants {
        return participants
    }
}
