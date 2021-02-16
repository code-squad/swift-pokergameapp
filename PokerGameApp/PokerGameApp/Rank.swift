//
//  CardValue.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import Foundation

struct Rank {
    private var rank = String()

    init(integerLiteral value: Int) {
        switch value {
        case 2...10: rank = String(value)
        case 1: rank = "A"
        case 11: rank = "J"
        case 12: rank = "Q"
        case 13: rank = "K"
        default: break
        }
    }
}
