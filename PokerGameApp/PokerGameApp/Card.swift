//
//  Card.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import Foundation

struct Card: CustomStringConvertible {
    /*
     Suit 타입은 enum으로 생성.
     CardValue와 달리 다양한 초기화가 불필요하고 String에 맞게 유니코드만 반환해주면 된다고 판단.
     */
    enum Suit: Character {
        case hearts = "❤️"
        case spades = "♠️"
        case diamonds = "♦️"
        case clubs = "♣️"
    }
    
    let value: Rank
    let suit: Suit
    
    init(value: Rank, suit: Suit) {
        self.value = value
        self.suit = suit
    }
    
    internal var description: String {
        return "\(suit)\(value.display)"
    }
    
    func display() {
        print(description)
    }
}
