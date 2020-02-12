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
        let firstRemovedCard = deck.removeOne()!
        let cardsAfterRemovedOne = deck.cards
        XCTAssertFalse((cardsAfterRemovedOne!.contains(firstRemovedCard)))
        
        let secondRemovedCard = deck.removeOne()!
        let cardsAfterRmoveOneMore = deck.cards
        XCTAssertTrue(cardsAfterRmoveOneMore!.contains(secondRemovedCard))
    }
}
