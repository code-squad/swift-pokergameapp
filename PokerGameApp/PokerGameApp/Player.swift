//
//  Player.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

class Player {
    private let hand: [Card]
    private let name: String
    
    init(hand: [Card], name: String) {
        self.hand = hand
        self.name = name
    }
}
