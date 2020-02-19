//
//  Players.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/18.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Players {
    private var players: [Player]
    
    init(players: [Player]) {
        self.players = players
    }
    
    func setupPlayers(playerCount: PlayerCount, with dealer: Dealer) {
        var nameIndex = 1
        playerCount.forEach {
            players.append(Player(name: "Player \(nameIndex)"))
            nameIndex += 1
        }
        players.append(dealer)
    }
    
    func winner() -> Player {
        players.forEach { (player) in
            player.calculate()
        }
        return players.sorted(by: { $0.hand > $1.hand }).first!
    }
    
    func passCardToPlayers(from dealer: Dealer, completion: (Players) -> ()) {
        players.forEach { (player) in
            guard let card = dealer.drawCard() else { return }
            player.takeCard(card)
        }
        completion(self)
    }
    
    func forEachPlayer(_ handler: (Player) -> ()) {
        players.forEach { (player) in
            handler(player)
        }
    }
}
