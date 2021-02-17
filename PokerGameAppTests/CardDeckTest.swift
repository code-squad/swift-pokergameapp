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
        cardDeck.initialize()
    }

    override class func tearDown() {
        super.tearDown()
    }
    
    func testShuffle(){
        XCTAssertNoThrow(cardDeck.shuffle(), "카드를 섞지 못했습니다")
    }
    
    func testRemoveOneCard(){
        let removed = cardDeck.removeOneCard()
        XCTAssertTrue(removed != nil, "남아있는 카드가 없습니다")
    }
    
    func testRemoveCards(){
        let count = 10
        let removed = cardDeck.removeCards(count: count)
        
        XCTAssertEqual(removed.count, count)
    }
    
    func testRemoveAll(){
        XCTAssertNoThrow(cardDeck.removeAll(), "카드를 초기화 할 수 없습니다.")
    }
    
    func testTakeOneCard(){
        let guessCount = 53
        let card = PlayingCard(suit: .clubs, rank: .eight)
        cardDeck.takeOneCard(card: card)
        
        XCTAssertEqual(guessCount, cardDeck.count, "카드가 정상적으로 추가되지 않았습니다.")
    }
    
    func testTakeCards(){
        let guessCount = 57
        let cards = [PlayingCard(suit: .clubs, rank: .ace),
                     PlayingCard(suit: .clubs, rank: .two),
                     PlayingCard(suit: .clubs, rank: .three),
                     PlayingCard(suit: .clubs, rank: .four),
                     PlayingCard(suit: .clubs, rank: .five)]
                     
        cardDeck.takeCards(cards: cards)
        
        XCTAssertEqual(guessCount, cardDeck.count, "카드가 정상적으로 추가되지 않았습니다.")
    }
}
