//
//  Card.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/16.
//

import Foundation

class Card: CustomStringConvertible {
    var shape: Shape
    var number: Number
    
    init(shape: Card.Shape, number:Card.Number) {
        self.shape = shape
        self.number = number
    }
    
    var description: String {
        switch number {
        case .A, .J, .Q, .K:
            return "\(shape.rawValue)\(number)"
        default:
            return "\(shape.rawValue)\(number.rawValue)"
        }
    }
    
    enum Shape: String {
        case clover = "♣️"
        case heart = "🧡"
        case diamond = "🔶"
        case spade = "♠️"
    }
    
    enum Number: Int {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten
        case J, Q, K
    }
}
