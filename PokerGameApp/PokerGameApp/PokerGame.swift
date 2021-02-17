//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/17.
//

import Foundation

class PokerGame {
    
    enum GameRule {
        case minPlayer
        case maxPlayer
        
        func getNumber() -> Int {
            switch self {
            case .minPlayer:
                return 1
            case .maxPlayer:
                return 4
            }
        }
    }
}
