//
//  CardData.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/16.
//

import Foundation

class Card: CustomStringConvertible {

    
    
    // 컨텍스트 외부에서 중첩된 사용을 하기 위해 Nested enum 타입을 사용
    // Suit을 위한 열거형 생성, rawValue가 Character 이므로 Character 타입 지정
    enum Suit: Character {
        case spade = "♠", heart = "❤", diamond = "◆", clover = "♣"
    }
    
    // Rank를 위한 열거형 생성, rawValue가 Int 이므로 Int 타입 지정
    enum Rank: Int {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
    }
    let suit: Suit, rank: Rank
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    // 출력되는 형식을 지정하기 위한 연산 프로퍼티 지정
    var description: String {
        switch rank {
        case .A, .J, .Q, .K:
            return "\(suit.rawValue)\(rank)"
        default:
            return "\(suit.rawValue)\(rank.rawValue)"
        }
    }
}
