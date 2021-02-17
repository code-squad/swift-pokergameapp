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

// 1-13 범위만 받을 수 있고, 값에 해당하는 String 값을 원시값으로 가지고 있다
enum Rank: String, CustomStringConvertible {
    var description: String { return "\(self.rawValue)" }
    
    case ace = "A", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10", jack = "J", queen = "Q", king = "K"
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
