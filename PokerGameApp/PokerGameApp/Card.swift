//
//  Card.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/15.
//

import Foundation

enum Suit : String, CustomStringConvertible {
    case spade = "♠️"
    case heart = "♥️"
    case club = "♣️"
    case diamond = "♦️"
    
    var description: String {
        return "\(self.rawValue)"
    }
}

enum Rank : Int, CustomStringConvertible {
    case A = 1,two,three,four,five,six,seven,eight,nine,ten,J,Q,K
    
    var description: String {
        return "\(self.reName())"
    }
    
    func reName() -> String {
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

// 머리속에 생각했을떄 카드라는 하나의 객체가 생각이 나서 그리고 객체지향을 연습한다면 클래스가 좋을거같다고 생각했습니다
class Card : CustomStringConvertible {
    let suit : Suit
    let rank : Rank
    
    init(suit : Suit, rank : Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    var description: String {
        return "\(suit)\(rank)"
    }
}
