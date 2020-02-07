//
//  Card.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/07.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Card {
    var shape: Shape
    var rank: Rank
    var info: String {
        return shape.rawValue + rank.value
    }
    
    init (shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    enum Shape: String {
        case heart = "♥︎", spade = "♠︎", clover = "♣︎", diamond = "♦︎"
    }
    
    // 랭크가 숫자일땐 숫자를 출력해줘야하고, 영어일땐 영어를 출력해줘야하는데 이걸 다 숫자로 두고 1, 11, 12, 13 때만 따로 처리할 수도 있겠지만 한번에 해주고싶어서 enum을 중첩해서 썼습니다.
    enum Rank {
        case number(Number)
        case character(Character)
        enum Number: Int {
            case two = 2, three, four, five, six, seven, eight, nine, ten
        }
        enum Character {
            case A, J, Q, K
        }
        var value: String {
            switch self {
            case let .number(num):
                return "\(num.rawValue)"
            case let .character(char):
                return "\(char)"
            }
        }
    }
}
