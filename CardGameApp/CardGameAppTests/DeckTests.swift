//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import CardGameApp
class DeckTests: XCTestCase {
    var deck: Deck!
    
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
        var originCards = [Card]()
        deck.searchCard { (card: Card ) in
            originCards.append(card)
        }
        
        // 2. when
        var generator = ANSI_C_RandomNumberGenerator()
        deck.shuffle(using: &generator)
        var deckCards = [Card]()
        deck.searchCard { (card: Card) in
            deckCards.append(card)
        }
        
        // 3. then
        XCTAssertNotEqual(deckCards, originCards)
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
        let otherDeck = Deck()
        // 2.when
        var generator = ANSI_C_RandomNumberGenerator()
        deck.shuffle(using: &generator)
        deck.reset()
        // 3.then
        XCTAssertEqual(otherDeck, deck)
        
    }
    
    func testScenario(){
        let totalCardCounts = 52
        XCTAssertEqual(deck.count, totalCardCounts)
        
        var generator = ANSI_C_RandomNumberGenerator()
        deck.shuffle(using: &generator)
        
        try! deck.removeOne()
        XCTAssertEqual(deck.count, totalCardCounts - 1 )
        
        try! deck.removeOne()
        XCTAssertEqual(deck.count, totalCardCounts - 2 )
    }

}
