//
//  DealerTest.swift
//  PokerGameAppTests
//
//  Created by 박혜원 on 2021/02/17.
//

import XCTest
@testable import PokerGameApp

class DealerTest: XCTestCase {
    
    var dealer : Dealer!

    override func setUp() {
        super.setUp()
        dealer = Dealer()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testinit(){
        let cardDeckCount = 52
        XCTAssertEqual(cardDeckCount, dealer.getRemainCardDeckCount(), "덱을 생성하지 못하였습니다.")
    }
    
    func testSpreadCards(){
        let guess = 52 - 5
        
        dealer.spreadCardsToDealer()
        XCTAssertEqual(guess, dealer.getRemainCardDeckCount(), "딜러에게 카드를 정상적으로 제공하지 못했습니다.")
    }
    
    func testResetCardDeck(){
        let guess = 52
        
        dealer.spreadCardsToDealer()
        dealer.resetCardDeck()
        
        XCTAssertEqual(guess, dealer.getRemainCardDeckCount(), "덱을 초기화 하지 못했습니다.")
        
    }
    
}
