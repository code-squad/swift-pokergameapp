//
//  PockerGame.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//

import Foundation

struct PockerGame {
    var players: [Player] = []
    var dealer: Dealer
    var cardStud: Int
    
    init(numberOfPlayer: Int, cardStud: Int) {
        self.cardStud = cardStud
        self.dealer = Dealer()
        addPlayer(numberOfPlayer)
    }
    
    mutating func addPlayer(_ number: Int) {
        for _ in 0..<number {
            players.append(Player())
        }
    }
    
    mutating func gameStart() {
        print("===\(cardStud) 기준, 참가자 \(players.count)명 일 때===")
        var ground = 1
        dealer.cardDeck.shuffle()
        while true {
            if !cardSetting() { return }
            
            print("\(ground)번 째 그라운드")
            for (index, player) in players.enumerated() {
                print("참가자#\(index+1) \(player)")
            }
            print("딜러#\(dealer)")
            ground += 1
        }
    }
    
    mutating func cardSetting() -> Bool {
        for player in players {
            if !dealer.distributeCard(with: player, stud: cardStud) {return false}
        }
        if !dealer.takeDealerCards(stud: cardStud) {return false}
        return true
    }
    
}
