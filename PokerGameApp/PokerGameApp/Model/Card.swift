//
//  Card.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/15.
//

import Foundation

enum Suit : String, CaseIterable, CustomStringConvertible {
    case spade = "♠️"
    case heart = "♥️"
    case club = "♣️"
    case diamond = "♦️"
    
    var description: String {
        return "\(self.rawValue)"
    }
    
    func firstLetter() -> String {
        switch self {
        case .club:
            return "c"
        case .diamond:
            return "d"
        case .heart:
            return "h"
        case .spade:
            return "s"
        }
    }
}

enum Rank : Int, CaseIterable, CustomStringConvertible {
    case A = 1,two,three,four,five,six,seven,eight,nine,ten,J,Q,K
    
    var description: String {
        switch self {
        case .A:
            return "A"
        case .J:
            return "J"
        case .Q:
            return "Q"
        case .K:
            return "K"
        default:
            return "\(self.rawValue)"
        }
    }
}

// 카드라는 객체는 참조하지않아도 되기 때문에 struct 구조체를 사용했습니다
struct Card : CustomStringConvertible {
    let suit : Suit
    let rank : Rank
    let imgName : String
    
    init(suit : Suit, rank : Rank) {
        self.suit = suit
        self.rank = rank
        self.imgName = "\(suit.firstLetter())\(rank)"
    }
    
    var description: String {
        return "\(suit)\(rank)"
    }
}
