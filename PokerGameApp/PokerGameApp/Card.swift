//
//  Card.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/15.
//

import Foundation

class Card {
    
    static var deck = [String]()
    
    static func makeDeck() {
        
        for cardNumber in cardValue.cardNum.allCases {
            deck.append(cardNumber.rawValue+String(cardValue.cardShape.spades.rawValue))
            deck.append(cardNumber.rawValue+String(cardValue.cardShape.clubs.rawValue))
            deck.append(cardNumber.rawValue+String(cardValue.cardShape.diamonds.rawValue))
            deck.append(cardNumber.rawValue+String(cardValue.cardShape.hearts.rawValue))
        }
        
        print(deck.randomElement()!)
        
    }
    
}

struct cardValue {
    
    // 상속이나 변경이 필요하지 않아 따로 struct에 구현했습니다.
    // 이를 통해 call by value, 값을 복사함으로써 원본 변경에 대한 위험을 줄일 수 있다고 이해할 수 있는지 더 생각하고 있습니다.
    // 열거형은 아직 익숙하지 않습니다. 그런 의미에서 사용한 부분도 있습니다.
    // 열거형보다 배열이 익숙한데, 배열보다 열거형을 선택함으로써 얻을 수 있는 이점이 무엇일지 찾아보고 있었습니다. 혹시 메모리와 관련이 있는지 더 찾아보겠습니다.
    
    enum cardShape: Character, CaseIterable {
        
        case spades = "\u{2664}", clubs = "\u{2667}", diamonds = "\u{2662}", hearts = "\u{2661}"
        
    }
    
    enum cardNum: String, CaseIterable {
        
        case one = "Ace", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10", eleven = "Jack", twelve = "Queen", thirteen = "King"
        
    }
    
}
