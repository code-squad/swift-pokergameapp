//
//  Player.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/18.
//

import Foundation

class Player {
    
    public var name: String
    public var hand = [Card]()
    
    init(name: String) {
        self.name = name
    }
    
}

class Players {
    
    private var willJoinGame = [Player]()
    
    public func participate(playerNum: Int) {
        for i in 1...playerNum {
            willJoinGame.append(Player(name: "Player \(i)"))
        }
        willJoinGame.append(Player(name: "Dealer"))
    }
    
    public func receiveCard(index: Int, card: Card) {
        willJoinGame[index].hand.append(card)
    }
    
    public func submitInfo() -> [Player] {
        return willJoinGame
    }
    
    public func retrieveCard() {
        willJoinGame.removeAll()
    }
    
}
