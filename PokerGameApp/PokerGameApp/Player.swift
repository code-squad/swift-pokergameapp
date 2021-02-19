//
//  Player.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/18.
//

import Foundation

class Player: Playable {
    private var cards = [Card]()
    
    public func reciveCard(_ card: Card) {
        cards.append(card)
    }
    
    public func showCards() -> [Card] {
        return cards
    }
    
    public func dropMyCards() {
        cards.removeAll()
    }
}

class Players {
    private var players = [Player]()
    var count: Int { players.count }
    
    public func takeSeat(with playerNumber: PokerGame.PlayerNumber) {
        for _ in 0..<playerNumber.value {
            players.append(Player())
        }
    }
    
    public func reciveCard(_ card: Card) {
        players.forEach { player in
            player.reciveCard(card)
        }
    }
    
    public func printAllCard() {
        for (number, player) in players.enumerated() {
            print("참가자#\(number+1) \(player.showCards())")
        }
    }
    
    public func dropAllCard() {
        players.forEach { player in
            player.dropMyCards()
        }
    }
}
