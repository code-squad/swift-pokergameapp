//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/18.
//

import Foundation

enum GameType: Int {
    case seven = 7
    case five = 5
    
    var value: Int {
        return self.rawValue
    }
}

enum PlayerNumber: Int {
    case one = 1, two, three, four
    
    var value: Int {
        return self.rawValue
    }
}

class PokerGame {
}
