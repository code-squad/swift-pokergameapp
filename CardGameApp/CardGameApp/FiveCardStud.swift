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
    
    func distributeCards() {
        players.forEach {
            dealer.drawCard()
            guard let drawnCard = dealer.drawnCard else {
                return
            }
            $0.hand.append(drawnCard)
        }
    }
    
    func run() {
        addPlayers()
        for _ in 1...5 {
            distributeCards()
        }
    }
}
