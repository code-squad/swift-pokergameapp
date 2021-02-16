//
//  CardValue.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import Foundation

enum Rank: Int, CustomStringConvertible, CaseIterable {
    case A = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case J
    case Q
    case K
    
    var description: String {
        switch self {
        case .A: return "A"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .ten: return "10"
        case .J: return "J"
        case .Q: return "Q"
        case .K: return "K"
        }
    }
}
