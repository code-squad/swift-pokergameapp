//
//  GameType.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

enum GameType: Int, CustomStringConvertible {
    case sevenCard = 7
    case fiveCard = 5
    
    init (_ number: Int) throws {
        switch number {
        case 1:
            self = .sevenCard
        case 2:
            self = .fiveCard
        default:
            throw GameMenuError.outOfRangeMenu
        }
    }
    var description: String {
        switch self {
        case .sevenCard:
            return "7 Cards"
        case .fiveCard:
            return "5 Cards"
        }
    }
}
