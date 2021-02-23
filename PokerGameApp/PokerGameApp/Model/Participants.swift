//
//  Participants.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/18.
//

import Foundation

class Participants {
    private var participants: [Participant] = []

    init(participantType: ParticipantType) {
        self.createParticipants(participantType)
    }
    
    var count: Int {
        return self.participants.count
    }

    func eachParticipant(method: (Int, Player) -> ()) {
        for (index, participant) in participants.enumerated() {
            method(index+1, participant)
        }
    }
    
    func resetParticipant(_ participantType: ParticipantType) {
        participants.removeAll()
        createParticipants(participantType)
    }
    
    func createParticipants(_ participantType: ParticipantType) {
        for _ in 1...participantType.rawValue {
            let participant = Participant()
            participants.append(participant)
        }
    }
}
