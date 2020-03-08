//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by Keunna Lee on 2020/02/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase  {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK:- Card 클래스 테스트 케이스
    func testDescripteCard() {
        // Given
        let card = Card(suit: .hearts , rank: .eight )
        
        // When
        let description = card.description
        
        // Then
        XCTAssertEqual(description, "♥️8")
    }
    
    // MARK:- CardDeck 구조체 테스트 케이스
    func testReset() {
        // given
        // CardDeck을 초기화할 때 reset() 함수가 호출됩니다.
        var cardDeck = CardDeck()
        let cardsCount = cardDeck.count()
        
        // Then
        XCTAssertEqual(cardsCount, 52)
    }
    
    func testCardsShuffled() {
        // Given
        var cardGameCardDeck = CardDeck()
        var seed = SystemRandomNumberGenerator()
        let randomNumber = ((0 ..< 52).shuffled(using: &seed).first)!
        let cardBeforeRandom = cardGameCardDeck.pickCard(of: randomNumber)
        
        // When
        cardGameCardDeck.shuffle()
        let cardAfterRandom = cardGameCardDeck.pickCard(of: randomNumber)
        
        // Then
        XCTAssertNotEqual(cardBeforeRandom, cardAfterRandom)
    }
    
    func testCountAfterRemoveOne() {
        // Given
        var cardDeck = CardDeck()
        let originalCount = cardDeck.count()
        var seed = SystemRandomNumberGenerator()
        let randomNumber = ((0 ..< 52).shuffled(using: &seed).first)!
        
        // When
        cardDeck.removeOne(of: randomNumber)
        let changedCount = cardDeck.count()
        
        // Then
        XCTAssertNotEqual(originalCount, changedCount)
    }
    
    func testCardInSameSquenceAfterRemoveOne(){
        //Given
        var seed = SystemRandomNumberGenerator()
        let IndexWillRemoveValue = ((0 ..< 52).shuffled(using: &seed).first)!
        var cardDeck = CardDeck()
        let cardBeforeRemoveOne = cardDeck.pickCard(of: IndexWillRemoveValue)
        
        //When
        cardDeck.removeOne(of: IndexWillRemoveValue)
        let cardAfterRemoveOne = cardDeck.pickCard(of: IndexWillRemoveValue)
        
        //Then
        XCTAssertNotEqual(cardBeforeRemoveOne, cardAfterRemoveOne)
    }
    
    func testSquenceIsPulled() {
        // Given
        var cardDeck = CardDeck()
        let originalCount = cardDeck.count()
        var randomCardIndexWillRemove = Int.random(in: 1..<originalCount-1)
        let nextCardFromRemoved = cardDeck.pickCard(of: randomCardIndexWillRemove+1)
        
        // When
        let removedOne = cardDeck.removeOne(of: randomCardIndexWillRemove)
        let movedCardToForward = cardDeck.pickCard(of: randomCardIndexWillRemove)
        
        // Then
        // 삭제 요청된 카드 다음 인덱스에 있던 카드가 삭제 후 삭제된 카드 인덱스에 있는지 확인한다
        XCTAssertEqual(nextCardFromRemoved, movedCardToForward)
    }
    
    func testCount() {
        // Given
        var cardDeck = CardDeck()
        let originalCount = cardDeck.count()
        var randomNumber = Int.random(in: 1..<originalCount-1)
        
        // When 초기화 했을 때
        cardDeck.removeOne(of: randomNumber)
        let changedCount = cardDeck.count()
        
        // Then
        XCTAssertEqual(originalCount, changedCount+1)
    }
    
    // MARK:-  HandCombination 클래스
    func testRemoveDuplication(){
        //given
        let handCombination = HandCombination()
        var cardsToCheck = [1,1,2,3,4,5,7,7,3,9,8]
        let expectedCards = [1,2,3,4,5,7,8,9]
        
        //when
        cardsToCheck.sort()
        let duplicationRemovedCards = handCombination.removeDuplication(in: cardsToCheck)
        
        //then
        XCTAssertEqual(duplicationRemovedCards, expectedCards)
    }
    
    func testCheckStraight(){
        //given
        let handCombination = HandCombination()
        var cardsToCheck = [1,1,2,3,4,5,7,7,3,9,8]
        let expectedCards : [Combination] = [.Straight]
        
        //when
        cardsToCheck.sort()
        let checkedStraight = handCombination.checkStraight(of: cardsToCheck)
        
        //then
        XCTAssertEqual(checkedStraight, expectedCards)
    }
    
    func testCheckPair(){
        let handCombination = HandCombination()
        let cardsToCheck = [1,2,3,1,12,3,4,3,4,2,5,3,2,6,5,4,3,3,9]
        
        //when
        handCombination.checkPair(of: cardsToCheck)
        
        //then
        XCTAssertEqual(handCombination.combinedCardsRank, [1,2,3,4,5])
        XCTAssertEqual(handCombination.combinationTypes, [2,3,6,3,2])
       
    }
}
