//
//  CardDeckTest.swift
//  PokerGameAppTests
//
//  Created by 박혜원 on 2021/02/16.
//

import XCTest
@testable import PokerGameApp

class CardDeckTest: XCTestCase {

    var cardDeck : CardDeck!
    
    override func setUp() {
        super.setUp()
        cardDeck = CardDeck()
    }

    override class func tearDown() {
        super.tearDown()
    }
    
    func testShuffle(){
        XCTAssertNoThrow(cardDeck.shuffle(), "카드를 섞지 못했습니다")
    }
}
