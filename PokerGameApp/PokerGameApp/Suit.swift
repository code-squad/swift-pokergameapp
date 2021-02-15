//
//  Suit.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import Foundation

/*
 Suit 타입은 enum으로 생성.
 CardValue와 달리 다양한 초기화가 불필요하고 String에 맞게 유니코드만 반환해주면 된다고 판단.
 */
enum Suit: String, CustomStringConvertible {
    case hearts = "H"
    case spades = "S"
    case diamonds = "D"
    case clubs = "C"
    
    var description: String {
        switch self {
        case .hearts: return "❤️"
        case .spades: return "♠️"
        case .diamonds: return "♦️"
        case .clubs: return "♣️"
        }
    }
}
