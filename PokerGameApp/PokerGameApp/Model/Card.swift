//
//  Card.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation

// custom initializer가 없는 불편함으로 Card를 클래스로 구현했었지만 structure types에 memberwise initializers가 있다는 걸 알았습니다.
struct Card {
    
    enum Suit: Character, CaseIterable {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clovers = "☘️"
    }
    
    enum Value: String, CaseIterable {
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case jack = "J"
        case queen = "Q"
        case king = "K"
        case ace = "A"
    }

    public let suit: Suit, value: Value
}
extension Card.Suit: CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)"
    }
}

extension Card.Value: CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)"
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.suit)\(self.value)"
    }
}
