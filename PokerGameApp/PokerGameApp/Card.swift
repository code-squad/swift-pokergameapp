//
//  Card.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/15.
//

import Foundation

class Card {
    
    enum Shapes: String {
//        ♣️
//        클로버 카드
//        유니코드: U+2663 U+FE0F, UTF-8: E2 99 A3 EF B8 8F
//        ♠️
//        스페이드 카드
//        유니코드: U+2660 U+FE0F, UTF-8: E2 99 A0 EF B8 8F
//        ❤️
//        빨간색 하트
//        유니코드: U+2764 U+FE0F, UTF-8: E2 9D A4 EF B8 8F
//        ♦️
//        다이아몬드 카드
//        유니코드: U+2666 U+FE0F, UTF-8: E2 99 A6 EF B8 8F
        case hearts = "\u{2764}\u{FE0F}", spades = "\u{2660}\u{FE0F}", clobers = "\u{2663}\u{FE0F}", diamonds = "\u{2666}\u{FE0F}"
    }
    let nums: [Int : String] = [
        1 : "A", 2 : "2", 3 : "3", 4 : "4", 5 : "5", 6 : "6", 7 : "7",
        8 : "8", 9 : "9", 10 : "10", 11 : "J", 12 : "Q", 13 : "K"
    ]
    
    private var num: Int
    private var shape: Shapes
    
    init(_ num: Int, _ shape: Shapes) {
        self.num = num
        self.shape = shape
    }
    
    func convertString() -> String {
        var tempString: String
        switch shape {
        case .hearts:
            tempString = Shapes.hearts.rawValue
        case .clobers:
            tempString = Shapes.clobers.rawValue
        case .diamonds:
            tempString = Shapes.diamonds.rawValue
        case .spades:
            tempString = Shapes.spades.rawValue
            
        }
        return tempString + nums[self.num]!
    }
    
    func printInfo() {
        print(convertString())

    }
    
    
}
