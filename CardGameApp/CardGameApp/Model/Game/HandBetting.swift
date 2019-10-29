//
//  HandBetting.swift
//  CardGame
//
//  Created by Elena on 08/02/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum HandBetting {
    case highCard(Shape,Number)
    case onePair(Shape,Number)
    case twoPair(Shape,Number)
    case threeOfAKind(Shape,Number)
    case fourOfAKind(Shape,Number)
    
    var ranking: Int {
        switch self {
        case .highCard: return 0
        case .onePair: return 1
        case .twoPair: return 2
        case .threeOfAKind: return 3
        case .fourOfAKind: return 4
        }
    }
    
    var number: Number {
        switch self {
        case let .highCard(_,number): return number
        case let .onePair(_,number): return number
        case let .twoPair(_,number): return number
        case let .threeOfAKind(_,number): return number
        case let .fourOfAKind(_,number): return number
        }
    }
    
    var shape: Shape {
        switch self {
        case let .highCard(shape,_): return shape
        case let .onePair(shape,_): return shape
        case let .twoPair(shape,_): return shape
        case let .threeOfAKind(shape,_): return shape
        case let .fourOfAKind(shape,_): return shape
        }
    }
}

extension HandBetting: Comparable {
    static func < (lhs: HandBetting, rhs: HandBetting) -> Bool {
        if lhs.ranking == rhs.ranking {
            return Card(number: lhs.number, shape: lhs.shape) < Card(number: rhs.number, shape: rhs.shape)
        }
        return lhs.ranking < rhs.ranking
    }
}

