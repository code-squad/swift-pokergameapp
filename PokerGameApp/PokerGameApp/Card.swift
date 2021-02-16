//
//  Card.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/16.
//

import Foundation

class Card: CustomStringConvertible {
    
    /*
     Suit와 Rank를 Nested Enum으로 구현한 이유:
     Suit와 Rank 모두 제한된 범위 내에서 값을 가지므로 Enum으로 구현하는 것이 안전하고 편리할 것이라 생각했습니다.
     또한 추후 카드 정보를 문자열로 반환시 1 → A, 11 → J 등 Rank의 몇몇 값을 변환해야 하는데,
     이때 switch statement를 사용하기에도 Enum이 좋을 것이라 판단했습니다.
     */
    
    enum Suit: Character {
        case spades = "\u{2660}"
        case hearts = "\u{2665}"
        case diamonds = "\u{2666}"
        case clubs = "\u{2663}"
    }
    
    enum Rank: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
    }
    
    let suit: Suit
    let rank: Rank
    var description: String {
        var convertedRank: String = ""
        switch rank {
        case .one:
            convertedRank = "A"
        case .eleven:
            convertedRank = "J"
        case .twelve:
            convertedRank = "Q"
        case .thirteen:
            convertedRank = "K"
        default:
            convertedRank = "\(rank.rawValue)"
        }
        return "\(suit.rawValue)\(convertedRank)"
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}
