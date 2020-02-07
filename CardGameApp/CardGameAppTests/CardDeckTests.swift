//
//  CardDeckTests.swift
//  CardGameAppTests
//
//  Created by Chaewan Park on 2020/02/07.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardDeckTests: XCTestCase {

    var cardDeck: CardDeck!
    
    override func setUp() {
        cardDeck = CardDeck()
    }
    
    func testCount() {
        XCTAssertEqual(cardDeck.count, 52)
    }
}
