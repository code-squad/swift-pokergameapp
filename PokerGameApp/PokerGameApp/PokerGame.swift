//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/19.
//

import Foundation

struct PokerGame {
    let rule: Rule
    let playerCount: PlayerCount
    // participant(dealer, players) 처럼 타입이 다른 둘을 묶는 건 좋지 않아보인다.
    var dealer = Dealer()
    var players = [Player]()
    
    init(rule: Int, playerCount: Int) {
        // 이 부분을 더 깔끔하게 표현하고 싶다..!
        self.rule = PokerGame.Rule(rawValue: rule)!
        self.playerCount = PokerGame.PlayerCount(rawValue: playerCount+1)!
        if isValid(rule: rule, playerCount: playerCount) {
            prepareGame()
            startGame()
            showGame()
        } else {
            print("Input Error")
        }
    }
    
    enum Rule: Int {
        case fiveCardStud = 5, sevenCardStud = 7
    }
    
    enum PlayerCount: Int {
        case one = 1, two, three, four
    }
    
    mutating func isValid(rule: Int, playerCount: Int) -> Bool{
        var ret = true
        if rule != 5 && rule != 7 { // 이때 enum을 사용해볼까
            ret = false
        }
        if playerCount < 0 || playerCount > 5 {
            ret = false
        }
        return ret
    }
    
    mutating func prepareGame() {

        for i in 0..<playerCount.rawValue {
            players.append(Player(number: i + 1))
        }
    }
    
    mutating func startGame() {
        dealer.giveCardToDealer(rule: self.rule.rawValue)
        
        for player in players {
            dealer.giveCardToPlayer(rule: self.rule.rawValue, player: player)
        }
    }
    
    mutating func showGame() {
        
        for player in players {
            print("참가자 #\(player.number) \(player.cards)")
        }
        print("딜러 \(dealer.cards)")
    }
}
