//
//  HandValueTests.swift
//  CardGameAppTests
//
//  Created by Cory Kim on 2020/02/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest
@testable import CardGameApp

class HandValueTests: XCTestCase {

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
        let handValue = HandValue(hand: hand)
        XCTAssert(handValue.value == Value.onePair)
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
        let handValue = HandValue(hand: hand)
        XCTAssert(handValue.value == Value.twoPairs)
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
        let handValue = HandValue(hand: hand)
        XCTAssert(handValue.value == Value.triple)
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
        let handValue = HandValue(hand: hand)
        XCTAssert(handValue.value == Value.fourCards)
    }
}
