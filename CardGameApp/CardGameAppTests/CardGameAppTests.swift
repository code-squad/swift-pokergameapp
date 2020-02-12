//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import CardGameApp
class CardGameAppTests: XCTestCase {
    var deck : Deck!
    
    override func setUp() {
        super.setUp()
        deck = Deck()
    }
    
    override func tearDown() {
        deck = nil
        super.tearDown()
    }
    
    func testDeckCount(){
        // 1. given is handled by setup
        // 2. when
        let count = deck.count
        // 3. then
        XCTAssertEqual(count,
                       52,
                       "sut.count is wrong")
    }
    
    func testShuffle(){
        // 1. given
        let otherDeck = deck
        // 2. when
        var equalCount = 0
        let maxTime = 100000
        for _ in 0 ..< maxTime {
            deck.shuffle()
            if otherDeck == deck {
                equalCount += 1
            }
        }
        // 3. then
        XCTAssertLessThanOrEqual(equalCount, 1)
    }
    
    func testRemoveOne() {
        // 1.given
        let card = Card(suit: .spade, number: .ace)
        // 2.when
        let result = try! deck.removeOne()
        // 3.then
        XCTAssertEqual(card , result)
    }
    
    func testReset() {
        // 1.given
        let otherDeck = deck
        // 2.when
        deck.shuffle()
        deck.reset()
        // 3.then
        XCTAssertEqual(otherDeck, deck)
    }
    
    func testScenario(){
        let totalCardCounts = 52
        var otherDeck = deck
        XCTAssertEqual(otherDeck?.count, totalCardCounts)
        
        otherDeck?.shuffle()
        
        try! otherDeck!.removeOne()
        XCTAssertEqual(otherDeck?.count, totalCardCounts - 1 )
        
        try! otherDeck!.removeOne()
        XCTAssertEqual(otherDeck?.count, totalCardCounts - 2 )
    }
}
