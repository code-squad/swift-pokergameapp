//
//  FiveCardStud.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class FiveCardStud {
    var dealer = Dealer()
    var players = [Player]()
    var numberOfPlayer: Int
    
    init(numberOfPlayer: Int) {
        self.numberOfPlayer = numberOfPlayer
    }
    
    func addPlayers() {
        for _ in 1...numberOfPlayer {
            players.append(Player())
        }
        players.append(dealer)
    }
}
