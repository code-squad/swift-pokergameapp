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
        let cards1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .two),
            Card(suit: .club, rank: .seven),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let cards2 = [
            Card(suit: .heart, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .diamond, rank: .two),
            Card(suit: .heart, rank: .king),
            Card(suit: .heart, rank: .four),
            Card(suit: .heart, rank: .five),
            Card(suit: .heart, rank: .six)
        ]
        
        var hand1 = Hand(cards: cards1)
        hand1.calculate()
        var hand2 = Hand(cards: cards2)
        hand2.calculate()
        
        XCTAssert(hand1 < hand2)
    }

    func testTwoPairsComparison1() {
        let cards1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .two),
            Card(suit: .spade, rank: .two),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let cards2 = [
            Card(suit: .heart, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .heart, rank: .two),
            Card(suit: .diamond, rank: .two),
            Card(suit: .heart, rank: .four),
            Card(suit: .heart, rank: .five),
            Card(suit: .heart, rank: .three)
        ]
        var hand1 = Hand(cards: cards1)
        hand1.calculate()
        var hand2 = Hand(cards: cards2)
        hand2.calculate()
        
        XCTAssert(hand1 > hand2)
    }
    
    func testTwoPairsComparison2() {
        let cards1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .club, rank: .three),
            Card(suit: .spade, rank: .three),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let cards2 = [
            Card(suit: .heart, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .heart, rank: .two),
            Card(suit: .diamond, rank: .two),
            Card(suit: .heart, rank: .four),
            Card(suit: .heart, rank: .five),
            Card(suit: .heart, rank: .three)
        ]
        var hand1 = Hand(cards: cards1)
        hand1.calculate()
        var hand2 = Hand(cards: cards2)
        hand2.calculate()
        
        XCTAssert(hand1 > hand2)
    }
    
    func testTripleComparison() {
        let cards1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .spade, rank: .two),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six)
        ]
        let cards2 = [
            Card(suit: .club, rank: .two),
            Card(suit: .heart, rank: .two),
            Card(suit: .diamond, rank: .two),
            Card(suit: .spade, rank: .seven),
            Card(suit: .heart, rank: .four),
            Card(suit: .heart, rank: .five),
            Card(suit: .heart, rank: .six)
        ]
        var hand1 = Hand(cards: cards1)
        hand1.calculate()
        var hand2 = Hand(cards: cards2)
        hand2.calculate()
        
        XCTAssert(hand1 < hand2)
    }
    
    func testFourCardsValue() {
        let cards1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .ace),
            Card(suit: .diamond, rank: .ace),
            Card(suit: .heart, rank: .ace),
            Card(suit: .club, rank: .four),
            Card(suit: .diamond, rank: .five),
            Card(suit: .heart, rank: .six)
        ]
        
        let cards2 = [
            Card(suit: .club, rank: .two),
            Card(suit: .spade, rank: .two),
            Card(suit: .diamond, rank: .two),
            Card(suit: .heart, rank: .two),
            Card(suit: .club, rank: .jack),
            Card(suit: .heart, rank: .ten),
            Card(suit: .club, rank: .seven)
        ]
        
        var hand1 = Hand(cards: cards1)
        hand1.calculate()
        var hand2 = Hand(cards: cards2)
        hand2.calculate()
        
        XCTAssert(hand1 < hand2)
    }
    
    func testStraightComparison() {
        let cards1 = [
            Card(suit: .club, rank: .ace),
            Card(suit: .spade, rank: .two),
            Card(suit: .diamond, rank: .three),
            Card(suit: .heart, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .diamond, rank: .five),
            Card(suit: .heart, rank: .six)
        ]
        
        let cards2 = [
            Card(suit: .club, rank: .king),
            Card(suit: .spade, rank: .king),
            Card(suit: .diamond, rank: .king),
            Card(suit: .heart, rank: .king),
            Card(suit: .club, rank: .jack),
            Card(suit: .heart, rank: .ten),
            Card(suit: .club, rank: .seven)
        ]
        
        var hand1 = Hand(cards: cards1)
        hand1.calculate()
        var hand2 = Hand(cards: cards2)
        hand2.calculate()
        
        XCTAssert(hand1.handRanking == .straight)
        XCTAssert(hand2.handRanking == .fourCards)
        
        XCTAssert(hand1 < hand2)
    }
}
