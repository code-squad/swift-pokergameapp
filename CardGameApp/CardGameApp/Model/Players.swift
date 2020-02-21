//
//  Players.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Players {
    enum PlayersNum: Int, CaseIterable {
        case one = 1 , two, three, four
        func forEach(handler: () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
    private var players = [Player]()
    private let playersNum: PlayersNum
    
    init(playersNum: PlayersNum) {
        self.playersNum = playersNum
        initPlayers(playersNum: playersNum)
    }
    
    private func initPlayers(playersNum: PlayersNum) {
        playersNum.forEach {
            players.append(Player())
        }
    }
}

extension Players.PlayersNum: CustomStringConvertible {
    var description: String {
        let num = String(self.rawValue)
        let people = "명"
        return num + people
    }
}

extension Players {
    func searchPlayer(handler: (Player) -> (Void)) {
        players.forEach{ handler($0) }
    }

    func searchPlayersNum(handler: (PlayersNum) -> ()) {
        handler(playersNum)
    }
}
