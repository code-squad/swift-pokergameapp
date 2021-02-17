//
//  Player.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import Foundation

class Player {
    private let hand: Hand
    private let name: String
    
    init(hand: Hand, name: String) {
        self.hand = hand
        self.name = name
    }
    
    var handInfo: Hand {
        return self.hand
    }
    
    var nameInfo: String {
        return self.name
    }
}
