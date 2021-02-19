//
//  Card.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import Foundation

class Card: CustomStringConvertible {
    
    /// 4가지 경우 중 한가지를 선택한다는 개념을 나타내기에 적절한 enum 타입으로 생성
    let suit: Suit
    
    enum Suit: String, CaseIterable, CustomStringConvertible {
        case spade = "s"
        case club = "c"
        case heart = "h"
        case diamond = "d"
        
        var description: String {
            return rawValue
        }
    }
    
    /// 1~13까지만 설정 가능하도록 enum 타입으로 생성
    /// 추후 연산 편리성 위해 rawValue 타입은 Int로 설정
    let rank: Rank
    
    enum Rank: Int, CaseIterable, CustomStringConvertible {
        case one = 1,
             two, three, four, five, six, seven,
             eight, nine, ten, eleven, twelve, thirteen
        
        var description: String {
            switch rawValue {
            case 1:
                return "A"
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return String(rawValue)
            }
        }
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    var description: String {
        return "\(suit)\(rank)"
    }
}
