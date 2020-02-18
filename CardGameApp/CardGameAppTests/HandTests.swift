//
//  HandTests.swift
//  CardGameAppTests
//
//  Created by Chaewan Park on 2020/02/19.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import CardGameApp

class HandTests: XCTestCase {

    var hand: Hand!
    
    override func setUp() {
        hand = Hand()
    }
    
    func testInsufficientContinityForFiveCards() {
        hand.add(card: Card(suit: .diamond, rank: .two))
        hand.add(card: Card(suit: .club, rank: .five))
        hand.add(card: Card(suit: .heart, rank: .eight))
        hand.add(card: Card(suit: .club, rank: .three))
        hand.add(card: Card(suit: .spade, rank: .four))
        
        let (continuity, highestCard) = hand.isContinuous(for: 5)
        XCTAssertFalse(continuity)
        XCTAssertEqual(highestCard, nil)
    }
    
    func testContinityForFive() {
        hand.add(card: Card(suit: .diamond, rank: .two))
        hand.add(card: Card(suit: .club, rank: .five))
        hand.add(card: Card(suit: .heart, rank: .six))
        hand.add(card: Card(suit: .club, rank: .three))
        hand.add(card: Card(suit: .spade, rank: .four))
        
        let (continuity, highestCard) = hand.isContinuous(for: 5)
        XCTAssertTrue(continuity)
        XCTAssertEqual(highestCard, Card(suit: .diamond, rank: .six))
    }
    
    func testDuplicatedContinityForSevenCards() {
        hand.add(card: Card(suit: .club, rank: .nine))
        hand.add(card: Card(suit: .heart, rank: .six))
        hand.add(card: Card(suit: .heart, rank: .ten))
        hand.add(card: Card(suit: .club, rank: .seven))
        hand.add(card: Card(suit: .spade, rank: .ten))
        hand.add(card: Card(suit: .spade, rank: .six))
        hand.add(card: Card(suit: .club, rank: .eight))
        
        let (continuity, highestCard) = hand.isContinuous(for: 5)
        XCTAssertTrue(continuity)
        XCTAssertEqual(highestCard, Card(suit: .diamond, rank: .ten))
    }
}
