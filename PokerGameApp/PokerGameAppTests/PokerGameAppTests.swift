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
        print("> 카드 초기화")
        let resetCardDeck = cardDeck.reset()
        print("카드 전체를 초기화했습니다")
        
        XCTAssertEqual(52, resetCardDeck.count)
        print("총 \(resetCardDeck.count)장의 카드가 있습니다.")
    }
    
    func testShuffled() {
        print("> 카드 섞기")
        let shuffledCardDeck = cardDeck.shuffle()
    
        XCTAssertNotEqual(cardDeck.reset(), shuffledCardDeck)
        print("> 전체 \(shuffledCardDeck.count)장의 카드를 섞었습니다.")
    }
    
    func testRemoveOne() {
        removeOne()
        XCTAssertEqual(51, cardDeck.count())
        print("총 \(cardDeck.count())장의 카드가 남아있습니다.")
        removeOne()
        XCTAssertEqual(50, cardDeck.count())
        print("총 \(cardDeck.count())장의 카드가 남아있습니다.")
    }
    
    private func removeOne() {
        print("> 카드 하나 뽑기")
        let cardToRemoved = cardDeck.removeOne()
        print(cardToRemoved)
    }
}
