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
    
    init(with numbersOfPlayers : NumbersOfPlayers?) {
        do {
            try numbersOfPlayers?.setPlayerSeat(for: ) {
                self.addPlayer(newPlayer: Player())
            }
        } catch {
            return
        }
    }
    
    func addPlayer(newPlayer : Player) {
        self.players.append(newPlayer)
    }
    
    func addCard(newCard: Card) {
        players.forEach{
            player in player.addCard(newCard: newCard)
        }
    }
    
    func showParticipantsCards(behavior: (Player) -> ()) {
        print("Players에서 showParticipantsCards 에서 players.count :  \(self.players.count)")
        players.forEach {
            behavior($0)
        }
    }
    
    
    
}
