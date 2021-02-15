//
//  CardValue.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/15.
//

import Foundation

/*
 CardValue는 구조체를 사용
 1. Int로 초기화시키고, String으로 display하기에 편한 구조라 생각.
 2. 프로그램 사용 중에 클래스 참조가 필요없어서 class는 생각하지 않음.
 */
struct CardValue: ExpressibleByIntegerLiteral {
    typealias IntegerLiteralType = Int
    
    let display: String
    let value: Int
    
    init(integerLiteral value: Int) {
        self.value = value
        switch value {
        case 2...10: display = String(value)
        case 1: display = "A"
        case 11: display = "J"
        case 12: display = "Q"
        case 13: display = "K"
        default:
            fatalError("value \(value) out of bounds for cardValue")
        }
    }
    
    init?(display: String) {
        guard display.count == 1 else { return nil }
        self.display = display
        
        switch display {
        case "A": value = 1
        case "J": value = 11
        case "Q": value = 12
        case "K": value = 13
        default:
            if let digit = Int(display) {
                value = digit
            } else {
                return nil
            }
        }
    }
}
