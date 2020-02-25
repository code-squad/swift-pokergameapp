//
//  ParticipantsNum.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct ParticipantsNum {
    enum PlayersNum: Int, CaseIterable {
        case one = 1 , two, three, four
        func forEach(handler: () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
    let playersNum: PlayersNum
    static let dealerCount = 1
}

extension ParticipantsNum.PlayersNum: Comparable {
    static func < (lhs: ParticipantsNum.PlayersNum, rhs: ParticipantsNum.PlayersNum) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension ParticipantsNum {
    static func forEachMaxCase(handler : () -> (Void)) {
        if let max = ParticipantsNum.PlayersNum.allCases.max() {
            let maxCount = max.rawValue + ParticipantsNum.dealerCount
            for _ in 0 ..< maxCount {
                handler()
            }
        }
    }
    
    func forEach(handler : () -> (Void)) {
        let participantsNum = playersNum.rawValue +
            ParticipantsNum.dealerCount
        for _ in 0 ..< participantsNum {
            handler()
        }
    }
}

extension ParticipantsNum.PlayersNum: CustomStringConvertible {
    var description: String {
        return String(self.rawValue)
    }
}
