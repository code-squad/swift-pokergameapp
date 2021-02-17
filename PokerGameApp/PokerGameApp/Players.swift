//
//  Players.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//

import Foundation

struct Players {
    private var players : [Player] = []
    
    init(number ofPlayer: Int) {
        for _ in 0..<ofPlayer {
            players.append(Player())
        }
    }
    
    func count() -> Int{
        return players.count
    }
    
    func distributeCards(with dealer: Dealer) {
        players.forEach { player in
            guard let newCards = dealer.give() else { return }
            player.receiveCards(with: newCards)
        }
    }
    
    func printDeck() {
        players.enumerated().forEach { (index, player) in
            print("참가자#\(index+1) \(player.playerDeck())")
        }
    }
}
