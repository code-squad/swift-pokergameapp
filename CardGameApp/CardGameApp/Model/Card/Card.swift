//
//  Card.swift
//  CardGame
//
//  Created by Elena on 23/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// 카드에 숫자와 도형을 표현하고, 카드를 표현하는 문자열을 정의
class Card: CustomStringConvertible {
    private let number: Number
    private let shape: Shape
    
    init(number: Number, shape: Shape) {
        self.number = number
        self.shape = shape
    }
    
    var description: String {
        return "\(shape.value)\(number.value)"
    }
    
}

extension Card {
    // 숫자가 같을때
    func same(_ number: Number) -> Bool {
        return self.number == number
    }
    //문자가 같을때
    func same(_ shape: Shape) -> Bool {
        return self.shape == shape
    }

}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        // 모양이 같으면 숫자가 큰쪽 반환
        if lhs.shape == rhs.shape {
            return lhs.number.rawValue < rhs.number.rawValue
        }
        // 숫자가 같으면 모양이 큰쪽 반환
        if lhs.number == rhs.number {
            return lhs.shape.rawValue < rhs.shape.rawValue
        }
        // 모양과 숫자가 같지 않다? 그럼 숫자가 큰걸 반환
        return lhs.number.rawValue < rhs.number.rawValue
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.number == rhs.number && lhs.shape == rhs.shape
    }
}
