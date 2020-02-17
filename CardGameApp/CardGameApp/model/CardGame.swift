//
//  CardGame.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/14.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class GameTable {
    private let playerEntry: playerEntry
    private let studType: StudType
    private var dealer: Dealer
    private var players: [Player]
  
    init(playerEntry: playerEntry, studType: StudType) {
        self.playerEntry = playerEntry
        self.studType = studType
        self.dealer = Dealer()
        self.players = [Player]()
        
        participatePlayer()
        initDrawCard()
    }
    
    // 플레이어 세팅
    func participatePlayer() {
        playerEntry.each {
            players.append(Player())
        }
        players.append(dealer)
    }
    
    // 플레이어 카드 분배.
    func initDrawCard() {
        players.forEach { (player) in
            studType.each {
                let card = dealer.drawCard()
                player.bringCard(card: card)
            }
        }
    }
    
    // 카드개수비교해서 게임 속행할지 확인
    func checkEndGame() -> Bool {
        return true
    }
}

enum StudType: Int {
    case fiveStud = 5
    case sevenStud = 7
    
    func each( function:() -> Void) {
        for _ in 1 ... self.rawValue {
            function()
        }
    }
}

enum playerEntry: Int {
    case two = 2
    case three = 3
    case four = 4
    
    func each( function:() -> Void) {
        for _ in 1 ... self.rawValue {
            function()
        }
    }
}
