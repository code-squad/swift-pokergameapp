//
//  Card.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation

// Nested Enum을 쓰기위해 원래는 Card class도 Enum으로 구현했지만 Enum 안에서 변수 선언이 안되는 불편함으로 Card는 class로 바꿨습니다. 하지만 Enum 데이터 타입의 가독성과 간단한 표현식 때문에 내부 Enum은 그대로 남겨두었습니다.
// CardDeck class에서 전체 enum 케이스에 iteration을 주기위해 CaseInterable 프로토콜을 사용했습니다.
class Card {
    let cardDescription: String
    
    enum Suit: Character, CaseIterable {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clovers = "🍀"
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
   
    init(suit: Suit, value: Value) {
        self.cardDescription = "\(suit.rawValue)\(value.rawValue)"
    }
}

