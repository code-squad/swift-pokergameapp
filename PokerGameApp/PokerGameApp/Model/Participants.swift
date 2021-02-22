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

    func eachParticipant(method: (Participant) -> ()) {
        participants.forEach({ method($0) })
    }
    
    func resetParticipant(_ participantType: ParticipantType) {
        participants.removeAll()
        createParticipants(participantType)
    }
    
    func createParticipants(_ participantType: ParticipantType) {
        for _ in 1...participantType.value {
            let participant = Participant(name: PlayerType.Pariticipant)
            participants.append(participant)
        }
    }
}
