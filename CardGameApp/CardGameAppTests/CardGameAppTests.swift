//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by 임승혁 on 2020/02/13.
//  Copyright © 2020 임승혁. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {
    
    var cardDeck: CardDeck!
    
    override func setUp() {
        cardDeck = CardDeck()
    }

    func testDeckCount() {
        XCTAssertEqual(cardDeck.count(), 52)
    }

}
