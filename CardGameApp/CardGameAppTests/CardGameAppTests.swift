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
        // given
        let initCardDeckbyReset = CardDeck()
        let cardsCount = initCardDeckbyReset.count()
        // Then
        XCTAssertEqual(cardsCount, 52)
    }
    
    func testShuffle() {
        // Given
        let cardGameCardDeck = CardDeck()
        let randomIndex = Int.random(in: 0 ... 52)
        let originalCard = cardGameCardDeck.cards[randomIndex]
        // When
        let shuffledCard = cardGameCardDeck.shuffle()[randomIndex]
        // Then
        XCTAssertNotEqual(originalCard, shuffledCard)
        //        XCTAssertNotEqual(originalCards.dropLast(), shuffledCards.dropLast())
    }
    
    func testRemoveOne() {
        // Given
        var cardDeck = CardDeck()
        let originalCount = cardDeck.cards.count
        var randomCardIndexWillRemove = Int.random(in: 1..<originalCount-1)
        let nextCardFromRemoved = cardDeck.cards[randomCardIndexWillRemove+1]
        // When
        let removedOne = cardDeck.removeOne(of: randomCardIndexWillRemove)
        let movedCardToForward = cardDeck.cards[randomCardIndexWillRemove]
        let changedCount = cardDeck.cards.count
        // Then
        XCTAssertNotEqual(originalCount, changedCount)
        // 삭제 요청된 카드 다음 인덱스에 있던 카드가 삭제 후 삭제된 카드 인덱스에 있는지 확인한다
        XCTAssertEqual(nextCardFromRemoved, movedCardToForward)
        XCTAssertNotEqual(removedOne, movedCardToForward)
    }
    
    func testCount() {
        // Given
        var cardDeck = CardDeck()
        let original = cardDeck.cards
        
        // When 처음값을 삭제했을 때
        cardDeck.removeOne(of: 0)
        let removeOne = cardDeck.cards
        
        // Then
        XCTAssertNotEqual(original, removeOne)
        
        // When 중간값을 삭제했을 때
        cardDeck.removeOne(of: 27)
        let removeOneMore = cardDeck.cards
        
        // Then
        XCTAssertNotEqual(removeOne, removeOneMore)
        
        // When 초기화 했을 때
        cardDeck.reset()
        let reset = cardDeck.cards
        // Then
        XCTAssertNotEqual(removeOneMore, reset)
    }
    
}
