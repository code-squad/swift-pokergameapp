//
//  Players.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/25.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

class Players {
    private var players = [Player]()
    
    init(with numberOfPlayers: Poker.NumberOfPlayers) {
        for _ in 1...numberOfPlayers.rawValue {
            players.append(Player())
        }
    }
    
    func receive(_ card: () -> (Card)) {
        for index in 0..<players.count {
            players[index].receive(card())
        }
    }
}
