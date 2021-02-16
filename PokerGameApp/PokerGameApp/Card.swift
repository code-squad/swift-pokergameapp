//
//  Card.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/16.
//

import Foundation

// 번호와 모양은 카드의 속성이므로 Card라는 클래스안에 중첩된 타입으로 Suit과 Rank를 생성하였으며
// 다양한 케이스들을 갖는 카드를 모델링하기때문에 Nested Type을 열거형으로 사용하였다.
class Card {
    private var suit: Suit
    private var rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    enum Suit: Character, CaseIterable {
        case spades = "♠"
        case hearts = "♡"
        case diamonds = "♢"
        case clubs = "♣"
    }
    
    enum Rank: String, CaseIterable {
        case one = "A", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10", eleven = "J", twelve = "Q", thirteen = "K"
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        var cardDescription = ""
        if let randSuit = Card.Suit.allCases.randomElement()?.rawValue, let randRank = Card.Rank.allCases.randomElement()?.rawValue {
            cardDescription = (String(describing: randSuit) + String(describing: randRank))
        }
        return cardDescription
    }
    
    
}


