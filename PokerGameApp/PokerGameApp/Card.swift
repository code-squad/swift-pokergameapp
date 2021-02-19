//
//  Card.swift
//  PokerGameApp
//
//  Created by Ador on 2021/02/16.
//

import Foundation

class Card: CustomStringConvertible {
    enum Shape: String, CaseIterable, CustomStringConvertible {
        case clover = "♣️"
        case heart = "♥️"
        case diamond = "♦️"
        case spade = "♠️"
        
        var description: String {
            return "\(self.rawValue)"
        }
        
        func getShortCut() -> String {
            switch self {
            case .clover:
                return "c"
            case .heart:
                return "h"
            case .diamond:
                return "d"
            case .spade:
                return "s"
            }
        }
    }
    
    enum Number: Int, CaseIterable, CustomStringConvertible {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten
        case J, Q, K
        
        var description: String {
            switch self {
            case .A:
                return "A"
            case .J:
                return "J"
            case .Q:
                return "Q"
            case .K:
                return "K"
            default:
                return "\(self.rawValue)"
            }
        }
        
        func getShortCut() -> String {
            switch self {
            case .A, .J, .Q, .K:
                return description
            default:
                return String(rawValue)
            }
        }
    }
    
    var shape: Shape
    var number: Number
    
    init(shape: Shape, number: Number) {
        self.shape = shape
        self.number = number
    }
    
    var description: String {
        return "\(shape.description)\(number.description)"
    }
}
