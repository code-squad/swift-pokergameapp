//
//  Players.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Participants {

    private var players = [Participant]()
    private let dealer = Participant()
    
    init(participantsNum: PokerGame.ParticipantsNum) {
        initPlayers(participantsNum: participantsNum)
    }
    
    private func initPlayers(participantsNum: PokerGame.ParticipantsNum) {
        participantsNum.playersNum.forEach {
            players.append(Participant())
        }
    }
}

extension Participants {
    
    func searchParticipants(handler: (Participant) -> (Void)) {
        var participants = players
        participants.append(dealer)
        participants.forEach { handler($0) }
    }
    
}
