//
//  Card.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/15.
//

import Foundation

// 4가지 모양만 존재 가능하다고 명시하는 효과가 있는 것 같아서 선택
enum Shape: Character {
    case Spade = "♠️"
    case Clover = "♣️"
    case Diamond = "♦️"
    case Heart = "♥️"
}

// 나중에 숫자 -> 문자열 변환이 편할 것 같아서
// 1-13 범위 밖 값은 nil 로 반환되어 예외처리하기 좋을 것 같아서
let rank = [1: "A", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9", 10: "10", 11: "J", 12: "Q", 13: "K"]


class Card {
    
    private let shape: Shape
    private let number: Int
    
    init(shape: Shape, num: Int) {
        self.shape = shape
        self.number = num
    }
    
    func showCardInfo() -> String {
        return "\(shape.rawValue)\(rank[number] ?? "")"
    }
    
}


