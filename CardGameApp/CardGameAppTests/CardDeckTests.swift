//
//  CardDeckTests.swift
//  CardGameAppTests
//
//  Created by Chaewan Park on 2020/02/07.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardDeckTests: XCTestCase {

    var cardDeck: CardDeck!
    
    let fullCardDeck = 52
    
    override func setUp() {
        cardDeck = CardDeck()
    }
    
    func testCount() {
        XCTAssertEqual(cardDeck.count, fullCardDeck)
    }
    
    func testRemoveOne() {
        _ = cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count, fullCardDeck - 1)
        _ = cardDeck.removeOne()
        XCTAssertEqual(cardDeck.count, fullCardDeck - 2)
    }
    
    func testReset() {
        XCTAssertEqual(cardDeck.count, fullCardDeck)
        _ = cardDeck.removeOne()
        _ = cardDeck.removeOne()
        cardDeck.reset()
        XCTAssertEqual(cardDeck.count, fullCardDeck)
    }
    
    func testShuffle() {
        let fixedGenerator = FixedRandomNumberGenerator()
        let cardsBeforeSuffle = (0..<fullCardDeck).map { _ in cardDeck.removeOne() }
        
        cardDeck.reset()
        cardDeck.shuffle(using: fixedGenerator)
        
        let cardsAfterSuffle = (0..<fullCardDeck).map { _ in cardDeck.removeOne() }
        XCTAssertNotEqual(cardsBeforeSuffle, cardsAfterSuffle)
    }
}

class FixedRandomNumberGenerator: RandomNumberGenerator {
    private var seed = 123456789
    private let modulus = 2 << 30
    private let multiplier = 1103515245
    private let increment = 12345
    
    func next<T>() -> T where T : FixedWidthInteger, T : UnsignedInteger {
        seed = (multiplier * seed + increment) % modulus
        return T(seed)
    }
}
