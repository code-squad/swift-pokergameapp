//
//  ScoreTest.swift
//  ScoreTest
//
//  Created by TTOzzi on 2020/02/17.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import CardGameApp
import XCTest

class ScoreTest: XCTestCase {

    var hand: Hand!
    
    override func setUp() {
        super.setUp()
        hand = Hand()
    }
    
    func testStraight() {
        hand.add(card: Card(shape: .clover, rank: .J))
        hand.add(card: Card(shape: .diamond, rank: .A))
        hand.add(card: Card(shape: .spade, rank: .Q))
        hand.add(card: Card(shape: .heart, rank: .three))
        hand.add(card: Card(shape: .diamond, rank: .ten))
        hand.add(card: Card(shape: .heart, rank: .nine))
        hand.add(card: Card(shape: .spade, rank: .eight))
        XCTAssertEqual(hand.score, .straight)
    }
    
    func testTriple() {
        hand.add(card: Card(shape: .clover, rank: .three))
        hand.add(card: Card(shape: .diamond, rank: .A))
        hand.add(card: Card(shape: .spade, rank: .three))
        hand.add(card: Card(shape: .heart, rank: .three))
        hand.add(card: Card(shape: .diamond, rank: .ten))
        hand.add(card: Card(shape: .heart, rank: .nine))
        hand.add(card: Card(shape: .spade, rank: .eight))
        XCTAssertEqual(hand.score, .triple)
    }

    func testTwopair() {
        hand.add(card: Card(shape: .clover, rank: .three))
        hand.add(card: Card(shape: .diamond, rank: .A))
        hand.add(card: Card(shape: .spade, rank: .four))
        hand.add(card: Card(shape: .heart, rank: .three))
        hand.add(card: Card(shape: .diamond, rank: .ten))
        hand.add(card: Card(shape: .heart, rank: .four))
        hand.add(card: Card(shape: .spade, rank: .eight))
        XCTAssertEqual(hand.score, .twoPair)
    }

    func testOnepair() {
        hand.add(card: Card(shape: .clover, rank: .three))
        hand.add(card: Card(shape: .diamond, rank: .A))
        hand.add(card: Card(shape: .spade, rank: .four))
        hand.add(card: Card(shape: .heart, rank: .three))
        hand.add(card: Card(shape: .diamond, rank: .ten))
        hand.add(card: Card(shape: .heart, rank: .nine))
        hand.add(card: Card(shape: .spade, rank: .eight))
        XCTAssertEqual(hand.score, .onePair)
    }
}
