//
//  CardValue.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import Foundation

enum Rank: Int, CustomStringConvertible, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case A, J, Q, K
    
    var description: String {
        switch self {
        case .A: return "A"
        case .J: return "J"
        case .Q: return "Q"
        case .K: return "K"
        default: return String(self.rawValue)
        }
    }
}
