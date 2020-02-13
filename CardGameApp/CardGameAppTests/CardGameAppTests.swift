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
        let originCards = deck
        // when
        deck.reset()
        let totalCount = originCards!.count
        // then
        XCTAssertEqual(totalCount, 52, "갯수가 맞지 않습니다")
    }
    
    func testShuffle() {
        let originCards = deck
        deck.shuffle()
        let shuffledCards = deck
        XCTAssertNotEqual(originCards, shuffledCards)
    }
    
    func testRemoveOne() {
        deck.removeOne()
        let cardsAfterRemovedOne = deck
        XCTAssertEqual(cardsAfterRemovedOne!.count,51)
        
        deck.removeOne()
        let cardsAfterRmoveOneMore = deck
        XCTAssertEqual(cardsAfterRmoveOneMore!.count,50)
    }
}
