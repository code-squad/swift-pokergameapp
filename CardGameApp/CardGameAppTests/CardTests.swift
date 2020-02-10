//
//  CardTests.swift
//  CardGameAppTests
//
//  Created by Viet on 2020/02/10.
//  Copyright © 2020 Viet. All rights reserved.
//

import XCTest

class CardTests: XCTestCase {
    func testNewCard() {
        let card = Card(suit: .heart, rank: .king)
        XCTAssertEqual(card.description, "♥️ K")
        
        let card2 = Card(suit: .spade, rank: .ten)
        XCTAssertEqual(card2.description, "♠️ 10")
    }
    
    func testCardDeck() {
        // count() 테스트
        var deck = Deck()
        let numberOfAllCards = 13 * 4
        XCTAssertEqual(deck.count, numberOfAllCards)
        
        // removeOne() 테스트
        let someCard = deck.removeOne()
        XCTAssert(someCard is Card)
        XCTAssertEqual(deck.count, numberOfAllCards - 1)
        deck.removeOne()
        XCTAssertEqual(deck.count, numberOfAllCards - 2)
        
        // reset() 테스트
        deck.reset()
        XCTAssertEqual(deck.count, numberOfAllCards)
    }
}
