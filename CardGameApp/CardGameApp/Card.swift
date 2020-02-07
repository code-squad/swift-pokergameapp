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

    init (shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    enum Shape: String {
        case heart = "♥︎", spade = "♠︎", clover = "♣︎", diamond = "♦︎"
    }
    
    // enum 을 중첩해서 사용하여 A, J, Q, K 와 숫자들을 구분해뒀었는데 생각해보니 나중에 포커게임을 구현할 때 연속된 숫자임을 확인하기 위해선 모두 Int 타입의 RawValue 를 가져야할것같아 수정해주었습니다.
    enum Rank: Int {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
    }
    
    func getInfo() -> String {
        var info = shape.rawValue
        switch rank {
        case .A, .J, .Q, .K:
            info += "\(rank)"
        default:
            info += "\(rank.rawValue)"
        }
        return info
    }
}
