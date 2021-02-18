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
    
<<<<<<< HEAD
<<<<<<< HEAD
    private var willJoinGame: Array<Player> = []
    public var hands = [[String]]()
    
    public func participatePlayer(num: Int) {
        for i in 1...num {
=======
=======
>>>>>>> 1983ea1b... dealer에 있었던 recruit를 participate로 받았습니다. 이니셜라이저에서 핸드를 제외했습니다.
    public var playerNum = 1
    
    public var willJoinGame: Array<Player> = []
    
    public func participatePlayer() {
        for i in 1...playerNum {
<<<<<<< HEAD
>>>>>>> 1983ea1b... dealer에 있었던 recruit를 participate로 받았습니다. 이니셜라이저에서 핸드를 제외했습니다.
=======
>>>>>>> 1983ea1b... dealer에 있었던 recruit를 participate로 받았습니다. 이니셜라이저에서 핸드를 제외했습니다.
            willJoinGame.append(Player(name: "Player\(i)"))
        }
        willJoinGame.append(Player(name: "Dealer"))
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
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
 
=======
>>>>>>> 1983ea1b... dealer에 있었던 recruit를 participate로 받았습니다. 이니셜라이저에서 핸드를 제외했습니다.
=======
>>>>>>> 1983ea1b... dealer에 있었던 recruit를 participate로 받았습니다. 이니셜라이저에서 핸드를 제외했습니다.
}
