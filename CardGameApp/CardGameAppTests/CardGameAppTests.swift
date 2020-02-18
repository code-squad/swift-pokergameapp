//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by jinie on 2020/02/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {
    
    var cardDeck: CardDeck!

    override func setUp() {
        cardDeck = CardDeck()
    }
    
    func testCount() {
        XCTAssertEqual(cardDeck.count(), 52)
    }

    func testRemoveOne() {
        let initCount = cardDeck.count()
        _ = cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count(), initCount - 1)
    }

    func testReset() {
        var anotherCardDeck = CardDeck()
        _ = anotherCardDeck.removeOne()
        anotherCardDeck.reset()
        XCTAssertTrue(anotherCardDeck == cardDeck)
    }
    
}
