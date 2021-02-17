//
//  Card.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/15.
//

import Foundation

class Card {
    
    enum Shapes: String, CaseIterable{
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
        case hearts = "❤️", spades = "♠️", clobers = "♣️", diamonds = "♦️"

    }

    enum Nums: Int, CaseIterable{
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
    
    private var num: Nums
    private var shape: Shapes
    
    init(_ num: Nums , _ shape: Shapes) {
        self.num = num
        self.shape = shape
    }
    
}
extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.shape)\(self.num)"
    }
}

extension Card.Nums: CustomStringConvertible {
    var description: String {
        var resultStr = ""
        switch self{
        case .one:
            resultStr = "A"
        case .jack:
            resultStr = "J"
        case .queen:
            resultStr = "Q"
        case .king:
            resultStr = "K"
        default:
            resultStr = "\(self.rawValue)"
        }
        return resultStr
    }
}

extension Card.Shapes: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}
