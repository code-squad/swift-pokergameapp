//
//  CardDeckTest.swift
//  PokerGameAppTests
//
//  Created by 박혜원 on 2021/02/16.
//

import XCTest
@testable import PokerGameApp

class CardDeckTest: XCTestCase {

    var cardDeck : PlayingCardDeck!
    
    override func setUp() {
        super.setUp()
        cardDeck = PlayingCardDeck()
    }

    override class func tearDown() {
        super.tearDown()
    }
    
    func testShuffle(){
        XCTAssertNoThrow(cardDeck.shuffle(), "카드를 섞지 못했습니다")
    }
    
    func testRemoveOne(){
        let removed = cardDeck.removeOneCard()
        XCTAssertTrue(removed != nil, "남아있는 카드가 없습니다")
    }
    
    func testReset(){
        XCTAssertNoThrow(cardDeck.reset(), "카드를 초기화 할 수 없습니다.")
    }
    
    func testTotalCardCount(){
        let randomNumber = Int.random(in: 1...10)
        let guess = 52 - randomNumber
    
        for _ in 0..<randomNumber {
            cardDeck.removeOneCard()
        }
        
        XCTAssertEqual(guess, cardDeck.count, "남아있는 카드의 개수에 오류가 있습니다.")
    }
}
