//
//  Participants.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/18.
//

import Foundation

class Participants {
    private var participants: [Participant] = []
    // 현재 카드를 받을 participant 를 나타낸다. (카드를 받을 차례)
    private var currentIndex: Int

    init(participantType: ParticipantType) {
        currentIndex = 0
        for i in 1...participantType.value {
            let participant = Participant(name: PlayerType.Pariticipant)
            participants.append(participant)
        }
    }
    var count: Int {
        return self.participants.count
    }

    func eachParticipant(method: (Participant) -> ()) {
        participants.forEach({ method($0) })
    }
}
