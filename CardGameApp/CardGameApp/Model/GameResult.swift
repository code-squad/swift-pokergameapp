//
//  GameResult.swift
//  CardGameApp
//
//  Created by delma on 26/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
enum GameResult: Int, Comparable, Equatable {
    case none = 0
    case onePair
    case twoPair
    case tripple
    case fourCard
    case straight
    
    static func < (lhs: GameResult, rhs: GameResult) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    static func > (lhs: GameResult, rhs: GameResult) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }
    
    static func >= (lhs: GameResult, rhs: GameResult) -> Bool {
        return lhs.rawValue >= rhs.rawValue
    }
    
    static func == (lhs: GameResult, rhs: GameResult) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
}
