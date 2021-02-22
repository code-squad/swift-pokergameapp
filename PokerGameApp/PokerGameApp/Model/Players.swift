//
//  Players.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/18.
//

import Foundation

class Players {
    private var players: [Player] = []
    
    init(participant: Participant) {
        for _ in 0..<participant.rawValue {
            players.append(Player())
        }
    }

    func distribute(dealer: Dealer) {
        players.forEach { (player) in
            let givenByDealer = dealer.give()
            player.takeCard(with: givenByDealer)
        }
    }
    
    func retrievePlayer(completion: (Player) -> Void) {
        players.forEach { (player) in
            completion(player)
        }
    }
    
    func printPlayerCards() {
        var count = 1
        players.forEach { (player) in
            print("참가자#\(count) \(player.description)")
            count += 1
        }
    }
}
