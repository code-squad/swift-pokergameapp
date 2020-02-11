//
//  Dealer.swift
//  CardGameApp
//
//  Created by Viet on 2020/02/11.
//  Copyright © 2020 Viet. All rights reserved.
//

import Foundation
class Dealer {
    var deck: Deck
    
    init(deck: Deck) {
        self.deck = deck
    }
    
    /// playerㅇ에게 한 장의 카드를 건넴
    func give(card: Card, to player: Player) {
        
    }
    
    /// 게임 준비. 카드를 섞는다
    func prepare() {
        self.deck.reset()
        self.deck.shuffle()
    }
    
    /// 게임을 시작한다. 자신을 포함해 모든 플레이어에게 카드를 돌린다.
    func startGame(players: [Player]) {
        (players + [self]).forEach { player in
            if let card = deck.removeOne() {
                self.give(card: card, to: player)
            }
        }
    }
}

class Player {
    
}
