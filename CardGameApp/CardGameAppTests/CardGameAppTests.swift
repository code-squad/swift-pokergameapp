//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by JW on 2020/02/11.
//  Copyright © 2020 JW. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {
    
    var deck: CardDeck!
    
    override func setUp() {
        super.setUp()
        self.deck = CardDeck()
    }

    override func tearDown() {
    }
//
//    func testCard() {
//        let card = Card(suit: .spades, rank: .seven)
//        let description = card.description
//        XCTAssertEqual(description, "♠️7")
//
//        let card2 = Card(suit: .hearts, rank: .one)
//        XCTAssertEqual(card2.description, "♥️A")
//    }
    
    func testReset() {
        // given
        let originCards = deck.cards
        // when
        deck.reset()
        let totalCount = originCards!.count
        // then
        XCTAssertEqual(totalCount, 52, "갯수가 맞지 않습니다")
    }
    
    func testShuffle() {
        let originCards = deck.cards
        deck.shuffle()
        let shuffledCards = deck.cards
        XCTAssertNotEqual(originCards, shuffledCards)
    }
    
    func testRemoveOne() {
        let originCards = deck.cards
        let randomIndex = 5
        deck.removeOne()
        let afterRemovedCards = deck.cards
        XCTAssertNotEqual(originCards![randomIndex], afterRemovedCards![randomIndex])
    }
}
