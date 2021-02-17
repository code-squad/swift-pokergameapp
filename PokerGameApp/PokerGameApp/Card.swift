//
//  Card.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/15.
//

import Foundation

// 4가지 모양만 존재 가능하다고 명시하는 효과가 있는 것 같아서 선택
enum Shape: Character, CustomStringConvertible {
    var description: String { return "\(self.rawValue)" }
    
    case Spade = "♠️"
    case Clover = "♣️"
    case Diamond = "♦️"
    case Heart = "♥️"
}

// 1-13 범위만 받을 수 있고, 숫자에 해당하는 String 값을 받을 수 있다
enum Rank: Int, CustomStringConvertible {
    case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    
    var description: String {
        switch self.rawValue {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return "\(self.rawValue)" }
        }
}


class Card: CustomStringConvertible {
    private let shape: Shape
    private let rank: Rank
    
    init(shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    var description: String {
        return "\(self.shape)\(self.rank)"
    }
}
