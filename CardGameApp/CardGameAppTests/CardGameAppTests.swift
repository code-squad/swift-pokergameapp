//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by Cloud on 2020/02/12.
//  Copyright © 2020 Cloud. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {

    var deck: Deck?
    var willCompareCards: [Card] = []
    var willCompareSuits: [Card] = []
    
    override func setUp() {
        deck = Deck()
    }

    func testCount() {
        XCTAssertEqual(deck?.count, 52)
    }
    
    func testShuffle() {
        deck?.shuffle()
        XCTAssertFalse(deck == Deck())
    }
    
    func testRemoveOne() {
        XCTAssertEqual(deck?.removeOne(), Card(suit: .diamond, rank: .thirteen))
    }
    
    func testRest() {
        deck?.shuffle()
        deck?.reset()
        XCTAssertEqual(deck, Deck())
    }
    
//    func testMakeSuit() {
//        let cards = deck?.makeSuit(suit: .club)
//        XCTAssertEqual(cards, willCompareCards)
//    }
//    
//    func testMakeDeck() {
//        deck?.makeDeck()
//        XCTAssertEqual(deck?.cards, willCompareSuits)
//    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
