//
//  HandValueTests.swift
//  CardGameAppTests
//
//  Created by Cory Kim on 2020/02/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest
@testable import CardGameApp

class ValueTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testOnePairValue() {
        let hand = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .two),
            Card(suit: .club, rank: .three),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let value = Value(hand: hand)
        XCTAssert(value.handRanking == HandRanking.onePair)
    }
    
    func testTwoPairsValue() {
        let hand = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .two),
            Card(suit: .spade, rank: .two),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let value = Value(hand: hand)
        XCTAssert(value.handRanking == HandRanking.twoPairs)
    }
    
    func testTripleValue() {
        let hand = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .spade, rank: .two),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let value = Value(hand: hand)
        XCTAssert(value.handRanking == HandRanking.triple)
    }
    
    func testFourCardsValue() {
        let hand = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .heart, rank: .ace),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let value = Value(hand: hand)
        XCTAssert(value.handRanking == HandRanking.fourCards)
    }
}
