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
        var otherDeckCards = [Card]()
        otherDeck?.search { (card : Card ) in
            otherDeckCards.append(card)
        }
        
        // 2. when
        var generator = ANSI_C_RandomNumberGenerator()
        deck.shuffle(using: &generator)
        var deckCards = [Card]()
        deck.search { (card : Card) in
            deckCards.append(card)
        }
        
        // 3. then
        XCTAssertNotEqual(deckCards, otherDeckCards)
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
        var generator = ANSI_C_RandomNumberGenerator()
        deck.shuffle(using: &generator)
        deck.reset()
        // 3.then
        XCTAssertEqual(otherDeck, deck)
    }
    
    func testScenario(){
        let totalCardCounts = 52
        var otherDeck = deck
        XCTAssertEqual(otherDeck?.count, totalCardCounts)
        
        var generator = ANSI_C_RandomNumberGenerator()
        otherDeck?.shuffle(using: &generator)
        
        try! otherDeck!.removeOne()
        XCTAssertEqual(otherDeck?.count, totalCardCounts - 1 )
        
        try! otherDeck!.removeOne()
        XCTAssertEqual(otherDeck?.count, totalCardCounts - 2 )
    }
}
