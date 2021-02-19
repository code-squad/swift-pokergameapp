//
//  Player.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/19.
//

import Foundation

class Player: Playable {
    private(set) var betting: Int
    let index: Int
    
    init(index: Int) {
        self.betting = 0
        self.index = index
    }
    
    func bet(money: Int) {
        betting += money
    }
}
