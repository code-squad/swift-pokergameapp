//
//  Participants.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/18.
//

import Foundation

class Participants {
    private var participants: [Participant] = []
    
    init(numOfParticipant: Int) {
        for _ in 1...numOfParticipant {
            let participant = Participant(name: PlayerType.Pariticipant)
            participants.append(participant)
        }
    }
}
