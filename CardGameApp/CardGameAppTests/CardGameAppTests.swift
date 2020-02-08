//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by delma on 07/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {

    var cardDeck: CardDeck!
    
    override func setUp() {
        super.setUp()
        cardDeck = CardDeck()
    }
    
    func testCount() {
         XCTAssertEqual(cardDeck.count(), 52)
    }
    
    func testShuffle() {
        let beforeShuffle = (0..<52).map { _ in  cardDeck.removeOne()
        }
        cardDeck.shuffle()
        let afterShuffle = (0..<52).map { _ in
            cardDeck.removeOne()
        }
        XCTAssertNotEqual(beforeShuffle, afterShuffle)
        
    }
    
    func testRemoveOne() {
        cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count(), 51)
        cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count(), 50)
    }
    
    func testReset() {
        XCTAssertEqual(cardDeck.count(), 52)
        cardDeck.removeOne()
        cardDeck.removeOne()
        cardDeck.reset()
        XCTAssertEqual(cardDeck.count(), 52)
    }
    
}
