//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by zombietux on 2021/02/16.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
   
    func testGenerateCardDeck() {
        print("> 카드 초기화")
        var cardDeck = CardDeck()
        print("카드 전체를 초기화했습니다")
        
        XCTAssertEqual(52, cardDeck.count())
        print("총 \(cardDeck.count())장의 카드가 있습니다.")
    }
}
