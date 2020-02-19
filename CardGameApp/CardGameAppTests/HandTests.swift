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
    
    func testWholeDuplicates() {
        hand.add(card: Card(suit: .heart, rank: .jack))
        hand.add(card: Card(suit: .diamond, rank: .jack))
        hand.add(card: Card(suit: .spade, rank: .jack))
        hand.add(card: Card(suit: .club, rank: .jack))
        hand.add(card: Card(suit: .diamond, rank: .jack))
        
        let overlappedCards = hand.overlapDuplicates().map { OverlappedCard($0) }
        let expectedCards = [(Card(suit: .heart, rank: .jack), 5)].map { OverlappedCard($0) }
        
        XCTAssertEqual(overlappedCards, expectedCards)
    }
    
    func testDoubleDuplicates() {
        hand.add(card: Card(suit: .heart, rank: .seven))
        hand.add(card: Card(suit: .diamond, rank: .ace))
        hand.add(card: Card(suit: .spade, rank: .jack))
        hand.add(card: Card(suit: .club, rank: .ace))
        hand.add(card: Card(suit: .diamond, rank: .jack))
        hand.add(card: Card(suit: .club, rank: .jack))
        hand.add(card: Card(suit: .diamond, rank: .ten))
        
        let overlappedCards = hand.overlapDuplicates().map { OverlappedCard($0) }
        let expectedCards = [(Card(suit: .heart, rank: .jack), 3),
                             (Card(suit: .heart, rank: .ace), 2),
                             (Card(suit: .heart, rank: .ten), 1),
                             (Card(suit: .heart, rank: .seven), 1)].map { OverlappedCard($0) }
        
        XCTAssertEqual(overlappedCards, expectedCards)
    }
    
    func testNoDuplicates() {
        hand.add(card: Card(suit: .heart, rank: .seven))
        hand.add(card: Card(suit: .diamond, rank: .ace))
        hand.add(card: Card(suit: .spade, rank: .jack))
        hand.add(card: Card(suit: .club, rank: .six))
        hand.add(card: Card(suit: .diamond, rank: .king))
        
        let overlappedCards = hand.overlapDuplicates().map { OverlappedCard($0) }
        let expectedCards = [(Card(suit: .heart, rank: .king), 1),
                             (Card(suit: .heart, rank: .jack), 1),
                             (Card(suit: .heart, rank: .seven), 1),
                             (Card(suit: .heart, rank: .six), 1),
                             (Card(suit: .heart, rank: .ace), 1)].map { OverlappedCard($0) }
        
        XCTAssertEqual(overlappedCards, expectedCards)
    }
}

struct OverlappedCard: Equatable {
    let card: Card
    let count: Int
    
    init(_ cards: (Card, Int)) {
        self.card = cards.0
        self.count = cards.1
    }
}
