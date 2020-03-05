//
//  Players.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Participants {
    enum PlayersNum: Int, CaseIterable {
        case one = 1 , two, three, four
        
        func forEach(handler: () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
    let playersNum: PlayersNum
    private var players = [Participant]()
    private static let dealerCount = 1
    private let dealer = Participant(name: "Dealer")
    
    init(playersNum: PlayersNum) {
        self.playersNum = playersNum
        initPlayers(playersNum: playersNum)
    }
    
    private func initPlayers(playersNum: PlayersNum) {
        var number = 1
        playersNum.forEach {
            players.append(Participant(name: "Player\(number)"))
            number += 1
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

extension Participants {
    
    static func forEachMaxCase(handler: () -> (Void)) {
        if let max = Participants.PlayersNum.allCases.max() {
            let maxCount = max.rawValue + Participants.dealerCount
            for _ in 0 ..< maxCount {
                handler()
            }
        }
    }
    
    func forEach(handler: () -> (Void)) {
        let participantsCount = playersNum.rawValue +
            Participants.dealerCount
        for _ in 0 ..< participantsCount {
            handler()
        }
    }
    
}

extension Participants.PlayersNum: Comparable {
    
    static func < (lhs: Participants.PlayersNum, rhs: Participants.PlayersNum) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
}

extension Participants.PlayersNum: CustomStringConvertible {
    
    var description: String {
        return String(self.rawValue)
    }
    
}
