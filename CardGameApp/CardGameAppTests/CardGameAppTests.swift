//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by Cory Kim on 2020/02/06.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest
import CardGameApp

class CardGameAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCardDeckInitializer() {
        print("> 카드 초기화")
        let cardDeck = CardDeck()
        print("카드 전체를 초기화했습니다.")
        XCTAssertTrue(cardDeck.count == 52)
        print("총 \(cardDeck.count)장의 카드가 있습니다.")
    }
}
