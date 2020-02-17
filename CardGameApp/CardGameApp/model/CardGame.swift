//
//  CardGame.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/14.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class GameTable {
    private let playerEntry: GameMode.Entry
    private let studType: GameMode.StudType
    private var dealer: Dealer
    private var players: Players
  
    init(playerEntry: GameMode.Entry, studType: GameMode.StudType) {
        self.playerEntry = playerEntry
        self.studType = studType
        self.dealer = Dealer()
        self.players = Players()
        
        settingPlayer()
        initDrawCard()
    }
    
    // 플레이어 세팅
    func settingPlayer() {
        for _ in 1 ... players.count {
            players.append(Player())
        }
        players.append(dealer)
    }
    
    // 플레이어 카드 분배.
    func initDrawCard() {
        for player in players {
            for _ in 1 ... studType {
                player.bringCard(card: self.dealer.drawCrad())
            }
        }
    }
    
    // 카드개수비교해서 게임 속행할지 확인
    func checkEndGame() -> Bool {
        return self.dealer.checkCardAmount() > players.count
    }
    
}
