//
//  Player.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/18.
//

import Foundation

class Player {
    
    private var name: String
    public var hand = [String]()
    
    init(name: String) {
        self.name = name
    }
    
}

class Players {
    
    public var playerNum = 1
    
    public var willJoinGame: Array<Player> = []
    
    public func participatePlayer() {
        for i in 1...playerNum {
            willJoinGame.append(Player(name: "Player\(i)"))
        }
        willJoinGame.append(Player(name: "Dealer"))
    }
    
}
