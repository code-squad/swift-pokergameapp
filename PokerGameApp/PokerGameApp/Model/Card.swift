//
//  Card.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/15.
//

import Foundation

class Card {
    
    enum Shapes: String, CaseIterable{
        case h = "❤️", s = "♠️", c = "♣️", d = "♦️"
    }

    enum Nums: Int, CaseIterable, CustomStringConvertible{
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
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
