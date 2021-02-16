//
//  CardValue.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import Foundation

struct Rank {
    private (set) var value = String()

    init(_ rank: Int) {
        switch rank {
        case 2...10: value = String(rank)
        case 1: value = "A"
        case 11: value = "J"
        case 12: value = "Q"
        case 13: value = "K"
        default: break
        }
    }
}
