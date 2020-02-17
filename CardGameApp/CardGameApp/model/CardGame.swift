//
//  CardGame.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/14.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class GameTable {
    private let playerEntry: Entry
    private let studType: StudType
    private var dealer: Dealer
    private var players: Players
  
    init(playerEntry: Entry, studType: StudType) {
        self.playerEntry = playerEntry
        self.studType = studType
        self.dealer = Dealer()
        self.players = Players()
        
        settingPlayer()
        initDrawCard()
    }
    
    // 플레이어 세팅
    func settingPlayer() {
        players.participate(entryAmount: playerEntry)
    }
    
    // 플레이어 카드 분배.
    func initDrawCard() {
        
    }
    
    // 카드개수비교해서 게임 속행할지 확인
    func checkEndGame() -> Bool {
        return false
    }
}

enum StudType: Int {
    case fiveStud = 5
    case sevenStud = 7
}

enum Entry: Int {
    case two = 2
    case three = 3
    case four = 4
    
    func each() {
        
    }
}
