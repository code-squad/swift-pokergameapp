//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by Keunna Lee on 2020/02/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {
    // Given
    var cardDeck = CardDeck()
    var cards = CardDeck().cards
    
    override func setUp() {
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAddCard() {
        // Given
        let viewController = ViewController()
        let cardStack = viewController.cardsStack
        // When
        let description = viewController.addCards()
        let subViewCount = cardStack.subviews.count
        // Then
        XCTAssertEqual(subViewCount, 7)
    }
    
    func testDescripteCard() {
        // Given
        let card = Card(suit: .hearts , rank: .eight )
        // When
        let description = card.descripteCard()
        // Then
        XCTAssertEqual(description, "♥️8")
    }
    
    func testReset() {
        // When
        cardDeck.reset()
        let count = cardDeck.cards.count
        // Then
        XCTAssertEqual(count, 52)
    }
    
    func testShuffle() { //
        // When
        cardDeck.shuffle()
        let shuffledCardDeck = cardDeck.cards
        // Then
        XCTAssertNotEqual(cards, shuffledCardDeck)
    }
    
    func testRemoveOne() {
        // Given
        let originalCount = cards.count
        var randomCardIndexWillRemove = Int.random(in: 0 ..< originalCount)
        let nextCardFromRemoved = cards[randomCardIndexWillRemove+1]
        // When
        let removedOne = cardDeck.removeOne(of: randomCardIndexWillRemove)
        let movedCardToForward = cards[randomCardIndexWillRemove]
        let changedCount = cards.count
        // Then
        XCTAssertNotEqual(originalCount, changedCount)
        // 삭제 요청된 카드 다음 인덱스에 있던 카드가 삭제 후 삭제된 카드 인덱스에 있는지 확인한다
        XCTAssertEqual(nextCardFromRemoved, movedCardToForward)
        XCTAssertNotEqual(removedOne, movedCardToForward)
    }
    
    func testCount() {
        // When 처음값을 삭제했을 때
        cardDeck.removeOne(of: 0)
        var count = cardDeck.cards.count
        // Then
        XCTAssertEqual(count, 51)
        
        // When 중간값을 삭제했을 때
        cardDeck.removeOne(of: 27)
        count = cardDeck.cards.count
        // Then
        XCTAssertEqual(count, 50)
        
        // When 초기화 했을 때
        cardDeck.reset()
        count = cardDeck.cards.count
        // Then
        XCTAssertEqual(count, 52)
    }
    
}
