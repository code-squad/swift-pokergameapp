//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by TTOzzi on 2020/02/07.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import CardGameApp
import XCTest

class CardGameAppTests: XCTestCase {

    var deck: Deck!
    
    override func setUp() {
        super.setUp()
        deck = Deck()
    }

    func testShuffle() {
        let beforeShuffle = deck
        deck.shuffle()
        XCTAssertNotEqual(beforeShuffle, deck)
    }
    
    func testReset() {
        let initialDeck = deck
        deck.shuffle()
        XCTAssertNotEqual(initialDeck, deck)
        deck.reset()
        XCTAssertEqual(initialDeck, deck)
    }
    
    func testRemoveOneAndCount() {
        let beforeRemove = deck.count
        for count in 1...beforeRemove {
            if let card = deck.removeOne() {
                print(card)
                XCTAssertEqual(beforeRemove - count, deck.count)
            }
        }
        XCTAssertNil(deck.removeOne())
    }
    
    func testExampleScenario() {
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
