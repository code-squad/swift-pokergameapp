//
//  CardsTest.swift
//  PokerGameAppTests
//
//  Created by 박혜원 on 2021/02/17.
//

import XCTest
@testable import PokerGameApp

class CardsTest: XCTestCase {
    
    var cardsObject : Cards!
    
    override func setUp() {
        super.setUp()
        cardsObject = Cards()
        cardsObject.cards.append(Card(suit: .hearts, rank: .ace))
        cardsObject.cards.append(Card(suit: .hearts, rank: .two))
        cardsObject.cards.append(Card(suit: .hearts, rank: .three))
        cardsObject.cards.append(Card(suit: .hearts, rank: .four))
        cardsObject.cards.append(Card(suit: .hearts, rank: .five))
        cardsObject.cards.append(Card(suit: .hearts, rank: .six))
        cardsObject.cards.append(Card(suit: .hearts, rank: .seven))
        cardsObject.cards.append(Card(suit: .hearts, rank: .eight))
        cardsObject.cards.append(Card(suit: .hearts, rank: .nine))
        cardsObject.cards.append(Card(suit: .hearts, rank: .ten))
    }

    override class func tearDown() {
        super.tearDown()
    }
    
    func testRemoveOneCard(){
        let removed = cardsObject.removeOneCard()
        XCTAssertTrue(removed != nil, "남아있는 카드가 없습니다")
    }
    
    func testRemoveCards(){
        let count = 10
        let removed = cardsObject.removeCards(count: count)
        
        XCTAssertEqual(removed.count, count)
    }
    
    func testRemoveAll(){
        XCTAssertNoThrow(cardsObject.removeAll(), "카드를 초기화 할 수 없습니다.")
    }
    
    func testTakeOneCard(){
        let guessCount = 11
        let card = Card(suit: .clubs, rank: .eight)
        cardsObject.takeOneCard(card: card)
        
        XCTAssertEqual(guessCount, cardsObject.cards.count, "카드가 정상적으로 추가되지 않았습니다.")
    }
    
    func testTakeCards(){
        let guessCount = 15
        
        let cards = [Card(suit: .clubs, rank: .ace),
                     Card(suit: .clubs, rank: .two),
                     Card(suit: .clubs, rank: .three),
                     Card(suit: .clubs, rank: .four),
                     Card(suit: .clubs, rank: .five)]
        
        cardsObject.takeCards(cards: cards)
        
        XCTAssertEqual(guessCount, cardsObject.cards.count, "카드가 정상적으로 추가되지 않았습니다.")
    }
}
