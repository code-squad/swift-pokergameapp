//
//  Test.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/16.
//

import Foundation

class Test {
    
    enum CardDeckTestCase: CustomStringConvertible {
        case create
        case shuffle
        case removeOne
        case reset
        
        var description: String {
            switch self {
            case .create:
                return "카드덱 생성"
            case .shuffle:
                return "카드 섞기"
            case .removeOne:
                return "카드 하나 뽑기"
            case .reset:
                return "카드 초기화"
            }
        }
    }
    
    private let testCase: CardDeckTestCase
    private let testDeck: CardDeck
    private let expectedValue: Int
    
    init(testCase: CardDeckTestCase, testDeck: CardDeck, expectedValue: Int) {
        self.testCase = testCase
        self.testDeck = testDeck
        self.expectedValue = expectedValue
    }
    
    private func testCreate(_ newCardDeck: CardDeck, with expectedValue: Int) -> Bool {
        return newCardDeck.count() == expectedValue
    }
}
