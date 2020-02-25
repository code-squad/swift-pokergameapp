//
//  CardGame.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/14.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class GameTable {
    private let playerEntry: PlayerEntry
    private let studType: StudType
    private var dealer: Dealer
    private(set) var players: [Player]
  
    init(playerEntry: PlayerEntry = .two, studType: StudType = .sevenStud) {
        self.playerEntry = playerEntry
        self.studType = studType
        self.dealer = Dealer(name: "Dealer")
        self.players = [Player]()
        
        participatePlayer()
        initDrawCard()
    }
    
    // 플레이어 세팅
    private func participatePlayer() {
        var index = 1
        playerEntry.each {
            players.append(Player(name: "Player\(index)"))
            index += 1
        }
        players.append(dealer)
    }
    
    // 플레이어 카드 분배.
    private func initDrawCard() {
        players.forEach { (player) in
            studType.each {
                let card = dealer.drawCard()
                player.bringCard(card: card)
            }
        }
    }
    
    // 카드개수비교해서 게임 속행할지 확인
    func isContinue() -> Bool {
        return dealer.cardDeckCount() > players.count
    }
}

enum StudType: Int, CaseIterable {
    case sevenStud = 7
    case fiveStud = 5
    
    func each( function:() -> Void) {
        for _ in 1 ... self.rawValue {
            function()
        }
    }
}

enum PlayerEntry: Int, CaseIterable {
    case two = 2
    case three = 3
    case four = 4
    
    func each( function:() -> Void) {
        for _ in 1 ... self.rawValue {
            function()
        }
    }
}
