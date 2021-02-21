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
    
    private var willJoinGame: Array<Player> = []
    public var hands = [[String]]()
    
    public func participatePlayer(num: Int) {
        for i in 1...num {
            willJoinGame.append(Player(name: "Player\(i)"))
        }
        willJoinGame.append(Player(name: "Dealer"))
    }
    
    public func dealerIndex() -> Int {
        return willJoinGame.endIndex-1
    }
    
    public func receiveCard(playerIndex: Int, card: String) {
        willJoinGame[playerIndex].hand.append(card)
    }
    
    public func printHand() {
        for i in 0..<willJoinGame.count {
            print(willJoinGame[i].hand)
        }
    }
    
    public func submitHandToDealer() {
        for i in 0..<willJoinGame.count {
            hands.append(willJoinGame[i].hand)
        }
    }
 
}
