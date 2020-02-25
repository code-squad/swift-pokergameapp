//
//  Poker.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/25.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

class Poker {
    enum Stud: Int {
        case fiveCard = 5, sevenCard = 7
        func forEach(_ closure: () -> ()) {
            for _ in 1...self.rawValue {
                closure()
            }
        }
    }
    
    enum NumberOfPlayers: Int {
        case one = 1, two, three, four
        func forEach(_ closure: () -> ()) {
            for _ in 1...self.rawValue {
                closure()
            }
        }
    }
    
    private var players = Players()
    private var dealer = Dealer()
    
    init(stud: Stud, numberOfPlayers: NumberOfPlayers) {
        dealer.shuffle()
        numberOfPlayers.forEach {
            let player = Player()
            stud.forEach {
                player.receive(dealer.card())
            }
            players.addPlayer(player)
        }
        stud.forEach {
            dealer.receive(dealer.card())
        }
    }
}
