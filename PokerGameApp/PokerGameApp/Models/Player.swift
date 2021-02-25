//
//  Player.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

class Player: Playable {
    private var hand: Hand
    let name: String
    
    init(hand: Hand, name: String) {
        self.hand = hand
        self.name = name
    }
    
    func calcHandKind() -> (Int, Set<Rank>) {
        return (hand.judge()?.tellScore() ?? 0, hand.combiCardRank)
    }
    
    func forEachPlayer(behavior: (Hand) -> ()) {
        behavior(hand)
    }
}
