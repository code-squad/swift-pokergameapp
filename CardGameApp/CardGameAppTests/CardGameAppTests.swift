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
    var sut : Deck!
    
    override func setUp() {
        super.setUp()
        sut = Deck()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDeckCount(){
        // 1. given
        sut = Deck()
        // 2. when
        let count = sut.count
        // 3. then
        XCTAssertEqual(count,
                       52,
                       "sut.count is wrong")
    }
    
    func testShuffle(){
        // 1. given
        
        // 2. when
        sut.shuffle()
//        let result = sut.getCards()
        // 3. then
//        XCTAssertNotEqual(cards, result)
    }
    
    func testRemoveOne() {
        // 1.given
        let card = Card.init(suit: .spade, number: .jack)
//        sut.cards = [card]
        
        // 2.when
        let result = sut.removeOne()
        
        // 3.then
//        XCTAssertEqual(card, result)
    }
    
    func testReset() {
        // 1.given
//        let other = sut

        // 2.when
        sut.shuffle()
        sut.reset()
        
        // 3.then
//        XCTAssertEqual(other?.cards, sut.cards)
    }
}
