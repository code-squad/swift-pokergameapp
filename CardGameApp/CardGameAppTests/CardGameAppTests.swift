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
        let description = card.descripteCard()
        
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
    
    // 플레이어끼리 갖고 있는 카드 중 겹치는게 없는지
    func testAreCardsDuplicated() {
        //Given
        var cardDeck = CardDeck()
               
        //When
        let checkResult = cardDeck.areCardsDuplicated
        
        //Then
        XCTAssertFalse(checkResult)
        
    }

    
    // MARK:-  pokerGame 클래스 테스트 케이스
    
    // 플레이어 객체가 참여 인원수 대로 생성 됐는지와 각 플레이어 객체가 스터드 수만큼 카드를 갖고 있는지
    // 참가자 프로토콜 - cardInHand 랑 isCardFull 메소드 만들기
    func testIsReady() {
        // Given
        var playersCount = Int.random(in: 1 ... 4)
        let game = Game() // pokerGame 안에 딜러 객체가 선언되어 있음
        
        // When
        game.start(stud : .fiveCardStud, with: playersCount)// PokerGame 클래스에 이넘을 가지고 있음.
        // 스타트하면 입력받은 명수 대로 플레이어 객체를 생성해서 배열을 반환하는 함수가 있고 Game 클래스의 참여인원 배열로 설정함.
        let setPlayersAndCards = game.isReady //true, false 반환.
        
        // Then
        XCTAssertTrue(setPlayersAndCards)
        
    }
    
    
}
