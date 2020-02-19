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
        let cards = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .two),
            Card(suit: .club, rank: .seven),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        var hand = Hand(cards: cards)
        hand.calculate()
        XCTAssert(hand.handRanking == HandRanking.onePair)
    }
    
    func testTwoPairsValue() {
        let cards = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .two),
            Card(suit: .spade, rank: .two),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        var hand = Hand(cards: cards)
        hand.calculate()
        XCTAssert(hand.handRanking == HandRanking.twoPairs)
    }
    
    func testTripleValue() {
        let cards = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .spade, rank: .two),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        var hand = Hand(cards: cards)
        hand.calculate()
        XCTAssert(hand.handRanking == HandRanking.triple)
    }
    
    func testFourCardsValue() {
        let cards = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .heart, rank: .ace),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        var hand = Hand(cards: cards)
        hand.calculate()
        XCTAssert(hand.handRanking == HandRanking.fourCards)
    }
}
