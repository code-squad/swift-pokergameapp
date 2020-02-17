//
//  CardGame.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/14.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class GameTable {
    // 플레이어 수 (딜러 제외)
    // 스터드 타입 (5, 7)
    // 카드 덱
    // 참가자 (딜러포함)
    private let playerCount: Int
    private let studType: Int
    
    private var dealer: Dealer
    private var players: [Player]
  
    init(playerCount: Int, studType: Int) {
        self.playerCount = playerCount
        self.studType = studType
        self.dealer = Dealer()
        self.players = [Player]()
        
        settingPlayer()
        initDrawCard()
    }
    
    // 플레이어 세팅
    func settingPlayer() {
        for _ in 1 ... playerCount {
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
        return self.dealer.checkCardAmount() > playerCount
    }
    
}
