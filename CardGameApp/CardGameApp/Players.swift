//
//  Players.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/18.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class Players {
    var players = [Player]()
    
    func addPlayer(newPlayer : Player) {
        players.forEach{_ in
            self.players.append(newPlayer)
        }
    }
    
    func addCard(newCard: Card) {
        players.forEach{
            player in player.addCard(newCard: newCard)
        }
    }
}
