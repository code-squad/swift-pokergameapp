//
//  Players.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Participants {
    
    enum PlayersNumber: Int, CaseIterable {
        case one = 1 , two, three, four
        
        func forEach(handler: () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
    let playersNumber: PlayersNumber
    private var players = [Participant]()
    var count: Int {
        return players.count + Participants.dealerCount
    }
    
    private static let dealerCount = 1
    private let dealer = Participant(name: "Dealer")
    
    private var winner: Participant?
    
    init(playersNumber: PlayersNumber) {
        self.playersNumber = playersNumber
        initPlayers(playersNum: playersNumber)
    }
    
    private func initPlayers(playersNum: PlayersNumber) {
        var number = 1
        playersNum.forEach {
            players.append(Participant(name: "Player\(number)"))
            number += 1
        }
    }
    
    func determineWinner() {
        var participants = players
        participants.append(dealer)
        
        if let winner = participants.max() {
            self.winner = winner
        }
    }
    
    func isWinner(participant: Participant) -> Bool {
        return winner === participant
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
        if let max = Participants.PlayersNumber.allCases.max() {
            let maxCount = max.rawValue + Participants.dealerCount
            for _ in 0 ..< maxCount {
                handler()
            }
        }
    }
    
}

extension Participants.PlayersNumber: Comparable {
    
    static func < (lhs: Participants.PlayersNumber, rhs: Participants.PlayersNumber) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
}

extension Participants.PlayersNumber: CustomStringConvertible {
    
    var description: String {
        return String(self.rawValue)
    }
    
}
