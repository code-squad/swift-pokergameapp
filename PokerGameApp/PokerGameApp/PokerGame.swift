//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/19.
//

import Foundation

struct PokerGame {
    let rule: Int
    let playerCount: Int

    var dealer = Dealer()
    var players = [Player]()
    
    init(rule: Int, playerCount: Int) {
        self.rule = rule
        self.playerCount = playerCount
        if isValid(rule: rule, playerCount: playerCount) {
            prepareGame()
            startGame()
            showGame()
        } else {
            print("Input Error")
        }
    }
    
    mutating func isValid(rule: Int, playerCount: Int) -> Bool{
        var ret = true
        if rule != 5 && rule != 7 { 
            ret = false
        }
        if playerCount < 0 || playerCount > 5 {
            ret = false
        }
        return ret
    }
    
    mutating func prepareGame() {

        for i in 0..<self.playerCount {
            players.append(Player(number: i + 1))
        }
    }
    
    mutating func startGame() {
        dealer.giveCardToDealer(rule: self.rule)
        
        for player in players {
            dealer.giveCardToPlayer(rule: self.rule, player: player)
        }
    }
    
    mutating func showGame() {
        
        for player in players {
            print("참가자 #\(player.number) \(player.playCards)")
        }
        print("딜러 \(dealer.playCards)")
    }
}
