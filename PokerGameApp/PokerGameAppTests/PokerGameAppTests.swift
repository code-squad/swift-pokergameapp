//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by zombietux on 2021/02/16.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    
    var cardDeck = CardDeck()
    
    func testGenerateCardDeck() {
        let resetCardDeck = CardDeckGenerator.generateCardDeck()
        
        XCTAssertEqual(52, resetCardDeck.count)
    }
    
    func testShuffled() {
        var cardDeckToShuffle = CardDeck()
        cardDeckToShuffle.shuffle()
    
        XCTAssertNotEqual(cardDeck, cardDeckToShuffle)
    }
    
    func testRemoveOne() {
        cardDeck.removeOne()
        XCTAssertEqual(51, cardDeck.count())
        cardDeck.removeOne()
        XCTAssertEqual(50, cardDeck.count())
    }
}
