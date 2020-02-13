//
//  Card.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/12.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Card {
    
    //suit와 rank는 위키백과 playing card에서 따옴.
    private let suit: Suit
    private let rank: Rank
    
    init(suit: Suit, rank: Rank){
        self.suit = suit
        self.rank = rank
    }
    
    // 특징이 있는 것들을 묶기 위해 Nested Enum 사용.
    // let spade = "" let diamond = "" .... 으로도 할 수 있으나,
    // 개인적으로 깔끔해 보이지 않고 의미가 명확하게 나뉘어서 보이지 않아 묶는게 좋다고 생각하여 Nested Enum을 사용함.
    
    // enum으로 카드모양 선언
    enum Suit: String, CustomStringConvertible {
        case spade = "s"
        case diamond = "d"
        case heart = "h"
        case clover = "c"
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    // enum으로 카드숫자 선언
    enum Rank: Int, CustomStringConvertible {
        case A = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        case J = 11
        case Q = 12
        case K = 13
        
        var description: String {
            switch self {
                case .A:
                    return "A"
                case .J:
                    return "J"
                case .Q:
                    return "Q:"
                case .K:
                    return "K"
                default:
                    return "\(self.rawValue)"
            }
        }
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return suit.description + rank.description
    }
}
