//
//  Players.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Participants {
    enum Number: Int, CaseIterable {
        case one = 1 , two, three, four
        func forEach(handler: () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
    private var players = [Participant]()
    private let dealer = Participant()
    private let playersNum: Number
    
    init(playersNum: Number) {
        self.playersNum = playersNum
        initPlayers(playersNum: playersNum)
    }
    
    private func initPlayers(playersNum: Number) {
        playersNum.forEach {
            players.append(Participant())
        }
    }
}

extension Participants.Number: CustomStringConvertible {
    var description: String {
        return String(self.rawValue)
    }
}

extension Participants {
    
    func searchParticipants(handler: (Participant) -> (Void)) {
        var participants = players
        participants.append(dealer)
        
        participants.forEach { handler($0) }
    }
}
