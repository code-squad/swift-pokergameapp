//
//  PockerGame.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//

import Foundation

struct PockerGame {
    private var players: Players
    private var dealer: Dealer
    private var cardStud: Event
    
    init(ofPlayer: Capacity, cardStud: Event) {
        self.cardStud = cardStud
        self.dealer = Dealer(stud: cardStud)
        self.players = Players(number: ofPlayer)
    }
    
    mutating func gameStart() {
        print("===\(cardStud) 기준, 참가자 \(players.count())명 일 때===")
        var ground = 1
        dealer.shuffle()
        while true {
            if !cardSetting() {
                print("===카드 부족 게임 종료===")
                return }
            
            print("\(ground)번 째 그라운드")
            players.printDeck()
            dealer.printDeck()
            ground += 1
        }
    }
    
    mutating func cardSetting() -> Bool {
       
        if !dealer.distribute(with: players) {
            return false
        }
        if !dealer.takeDealerCards() {
            return false
        }
        return true
    }
    
}
