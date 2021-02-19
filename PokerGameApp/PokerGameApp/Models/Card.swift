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
    
    enum Suit: CustomStringConvertible, CaseIterable {
        case spades, hearts, diamonds, clubs
        
        var description: String {
            switch self {
            case .spades:
                return "s"
            case .hearts:
                return "h"
            case .diamonds:
                return "d"
            case .clubs:
                return "c"
            }
        }
    }
    
    enum Rank: Int, CustomStringConvertible, CaseIterable {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        
        var description: String {
            switch self {
            case .one:
                return "A"
            case .eleven:
                return "J"
            case .twelve:
                return "Q"
            case .thirteen:
                return "K"
            default:
                return "\(self.rawValue)"
            }
        }
    }
    
    let suit: Suit
    let rank: Rank
    var description: String {
        return "\(suit)\(rank)"
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}
