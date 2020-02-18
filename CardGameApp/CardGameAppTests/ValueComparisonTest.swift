//
//  ValueComparisonTest.swift
//  CardGameAppTests
//
//  Created by Cory Kim on 2020/02/17.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest

class ValueComparisonTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testOnePairComparison() {
        let hand1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .two),
            Card(suit: .club, rank: .three),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let hand2 = [
            Card(suit: .heart, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .diamond, rank: .two),
            Card(suit: .heart, rank: .king),
            Card(suit: .heart, rank: .four),
            Card(suit: .heart, rank: .five),
            Card(suit: .heart, rank: .six)
        ]
        let value1 = Value(hand: hand1)
        let value2 = Value(hand: hand2)
        
        XCTAssert(value1 < value2)
    }

    func testTwoPairsComparison1() {
        let hand1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .two),
            Card(suit: .spade, rank: .two),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let hand2 = [
            Card(suit: .heart, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .heart, rank: .two),
            Card(suit: .diamond, rank: .two),
            Card(suit: .heart, rank: .four),
            Card(suit: .heart, rank: .five),
            Card(suit: .heart, rank: .three)
        ]
        let value1 = Value(hand: hand1)
        let value2 = Value(hand: hand2)
        
        XCTAssert(value1 > value2)
    }
    
    func testTwoPairsComparison2() {
        let hand1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .three),
            Card(suit: .spade, rank: .three),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let hand2 = [
            Card(suit: .heart, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .heart, rank: .two),
            Card(suit: .diamond, rank: .two),
            Card(suit: .heart, rank: .four),
            Card(suit: .heart, rank: .five),
            Card(suit: .heart, rank: .three)
        ]
        let value1 = Value(hand: hand1)
        let value2 = Value(hand: hand2)
        
        XCTAssert(value1 > value2)
    }
    
    func testTripleComparison() {
        let hand1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .spade, rank: .two),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let hand2 = [
            Card(suit: .club, rank: .two),
            Card(suit: .heart, rank: .two),
            Card(suit: .diamond, rank: .two),
            Card(suit: .spade, rank: .seven),
            Card(suit: .heart, rank: .four),
            Card(suit: .heart, rank: .five),
            Card(suit: .heart, rank: .six)
        ]
        let value1 = Value(hand: hand1)
        let value2 = Value(hand: hand2)
        
        XCTAssert(value1 < value2)
    }
    
    func testFourCardsValue() {
        let hand1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .heart, rank: .ace),
            Card(suit: .club, rank: .four),
            Card(suit: .diamond, rank: .five),
            Card(suit: .heart, rank: .six)
        ]
        
        let hand2 = [
            Card(suit: .club, rank: .two),
            Card(suit: .spade, rank: .two),
            Card(suit: .diamond, rank: .two),
            Card(suit: .heart, rank: .two),
            Card(suit: .club, rank: .jack),
            Card(suit: .heart, rank: .ten),
            Card(suit: .club, rank: .seven)
        ]
        
        let value1 = Value(hand: hand1)
        let value2 = Value(hand: hand2)
        
        XCTAssert(value1 < value2)
    }
    
    func testStraightComparison() {
        let hand1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .two),
            Card(suit: .diamond, rank: .three),
            Card(suit: .heart, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .diamond, rank: .five),
            Card(suit: .heart, rank: .six)
        ]
        
        let hand2 = [
            Card(suit: .club, rank: .king),
            Card(suit: .spade, rank: .king),
            Card(suit: .diamond, rank: .king),
            Card(suit: .heart, rank: .king),
            Card(suit: .club, rank: .jack),
            Card(suit: .heart, rank: .ten),
            Card(suit: .club, rank: .seven)
        ]
        
        let value1 = Value(hand: hand1)
        let value2 = Value(hand: hand2)
        
        XCTAssert(value1.handRanking == .straight)
        XCTAssert(value2.handRanking == .fourCards)
        
        XCTAssert(value1 < value2)
    }
}
