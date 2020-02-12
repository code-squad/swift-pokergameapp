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
        
        willCompareCards = [
            Card(suit: .club, rank: .one),
            Card(suit: .club, rank: .two),
            Card(suit: .club, rank: .three),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six),
            Card(suit: .club, rank: .seven),
            Card(suit: .club, rank: .eight),
            Card(suit: .club, rank: .nine),
            Card(suit: .club, rank: .ten),
            Card(suit: .club, rank: .eleven),
            Card(suit: .club, rank: .twelve),
            Card(suit: .club, rank: .thirteen),
        ]
        
        willCompareSuits = [
        Card(suit: .diamond, rank: .one),
        Card(suit: .diamond, rank: .two),
        Card(suit: .diamond, rank: .three),
        Card(suit: .diamond, rank: .four),
        Card(suit: .diamond, rank: .five),
        Card(suit: .diamond, rank: .six),
        Card(suit: .diamond, rank: .seven),
        Card(suit: .diamond, rank: .eight),
        Card(suit: .diamond, rank: .nine),
        Card(suit: .diamond, rank: .ten),
        Card(suit: .diamond, rank: .eleven),
        Card(suit: .diamond, rank: .twelve),
        Card(suit: .diamond, rank: .thirteen),
        Card(suit: .hert, rank: .one),
        Card(suit: .hert, rank: .two),
        Card(suit: .hert, rank: .three),
        Card(suit: .hert, rank: .four),
        Card(suit: .hert, rank: .five),
        Card(suit: .hert, rank: .six),
        Card(suit: .hert, rank: .seven),
        Card(suit: .hert, rank: .eight),
        Card(suit: .hert, rank: .nine),
        Card(suit: .hert, rank: .ten),
        Card(suit: .hert, rank: .eleven),
        Card(suit: .hert, rank: .twelve),
        Card(suit: .hert, rank: .thirteen),
        Card(suit: .spade, rank: .one),
        Card(suit: .spade, rank: .two),
        Card(suit: .spade, rank: .three),
        Card(suit: .spade, rank: .four),
        Card(suit: .spade, rank: .five),
        Card(suit: .spade, rank: .six),
        Card(suit: .spade, rank: .seven),
        Card(suit: .spade, rank: .eight),
        Card(suit: .spade, rank: .nine),
        Card(suit: .spade, rank: .ten),
        Card(suit: .spade, rank: .eleven),
        Card(suit: .spade, rank: .twelve),
        Card(suit: .spade, rank: .thirteen),
        ]
        
        willCompareSuits.append(contentsOf: willCompareCards)
        
        
    }

    func testCount() {
        XCTAssertEqual(deck?.count, 52)
    }
    
    func testShuffle() {
        deck?.shuffle()
        XCTAssertEqual(deck, Deck())
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
