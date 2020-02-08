//
//  IntegrationTest.swift
//  IntegrationTest
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import CardGameApp
import XCTest

class IntegrationTest: XCTestCase {

    var deck: Deck!
    
    override func setUp() {
        super.setUp()
        deck = Deck()
    }

    func testIntegration() {
        let initialDeck = deck
        deck.reset()
        XCTAssertEqual(deck.count, 52)
        deck.shuffle()
        XCTAssertNotEqual(deck, initialDeck)
        deck.removeOne()
        XCTAssertEqual(deck.count, 51)
        deck.removeOne()
        XCTAssertEqual(deck.count, 50)
    }
}
