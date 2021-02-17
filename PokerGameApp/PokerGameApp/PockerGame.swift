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
        print("\(cardStud) 기준, 참가자 \(players.count)명 일 때")
        
        dealer.cardDeck.shuffle()
        

        cardSetting()
    
        for (index, player) in players.enumerated() {
            print("참가자#\(index+1) \(player)")
        }
        print("딜러#\(dealer)")
    }
    
    mutating func cardSetting() {
        for player in players {
            dealer.distributeCard(with: player, stud: cardStud)
        }
        dealer.takeDealerCards(stud: cardStud)
    }
    
}
