//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by 신한섭 on 2020/02/06.
//  Copyright © 2020 신한섭. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShuffle(){
        var cardSet = CardDeck()
        let beforeShuffledCarset = cardSet
        var isSame = true
        cardSet.shuffle()
        isSame = (cardSet == beforeShuffledCarset)
        XCTAssert(isSame == false)
    }
    
    func testRemoveOne(){
        var cardSet = CardDeck()
        if cardSet.count() == 0{
            XCTAssertEqual(cardSet.removeOne(),nil)
        } else{
            let beforeRemovedCount = cardSet.count()
            cardSet.removeOne()
            XCTAssertEqual(cardSet.count(), (beforeRemovedCount - 1))
        }
    }
    
    func testReset(){
        var cardSet = CardDeck()
        cardSet.reset()
        XCTAssertEqual(cardSet.count(), 52)
    }
    
    func testCheckStraight(){
        var cards = [Card]()
        cards.append(Card(rank: .ace, suit: .clover))
        cards.append(Card(rank: .two, suit: .clover))
        cards.append(Card(rank: .three, suit: .clover))
        cards.append(Card(rank: .four, suit: .clover))
        cards.append(Card(rank: .five, suit: .clover))
        cards.append(Card(rank: .seven, suit: .clover))
        cards.append(Card(rank: .nine, suit: .clover))
        
        XCTAssertTrue(Hand().checkStraight(cards: cards))
        
        cards = [Card]()
        cards.append(Card(rank: .ace, suit: .clover))
        cards.append(Card(rank: .seven, suit: .clover))
        cards.append(Card(rank: .ten, suit: .clover))
        cards.append(Card(rank: .four, suit: .clover))
        cards.append(Card(rank: .five, suit: .clover))
        
        XCTAssertFalse(Hand().checkStraight(cards: cards))
    }
    
    func testSameCard(){
        var cards = [Card]()
        cards.append(Card(rank: .ace, suit: .clover))
        cards.append(Card(rank: .two, suit: .clover))
        cards.append(Card(rank: .three, suit: .clover))
        cards.append(Card(rank: .five, suit: .heart))
        cards.append(Card(rank: .five, suit: .clover))
        cards.append(Card(rank: .five, suit: .diamond))
        cards.append(Card(rank: .five, suit: .spade))
        
        XCTAssertTrue(Hand().checkSameCard(howMany: .fourCard, cards: cards.sorted()))
        XCTAssertFalse(Hand().checkSameCard(howMany: .triple, cards: cards.sorted()))
        
        cards = [Card]()
        cards.append(Card(rank: .ace, suit: .clover))
        cards.append(Card(rank: .two, suit: .clover))
        cards.append(Card(rank: .three, suit: .clover))
        cards.append(Card(rank: .seven, suit: .heart))
        cards.append(Card(rank: .five, suit: .clover))
        cards.append(Card(rank: .five, suit: .diamond))
        cards.append(Card(rank: .five, suit: .spade))
        
        XCTAssertFalse(Hand().checkSameCard(howMany: .fourCard, cards: cards.sorted()))
        XCTAssertTrue(Hand().checkSameCard(howMany: .triple, cards: cards.sorted()))
    }
    
    func testCheckPair(){
        var cards = [Card]()
        cards.append(Card(rank: .ace, suit: .clover))
        cards.append(Card(rank: .ace, suit: .clover))
        cards.append(Card(rank: .three, suit: .clover))
        cards.append(Card(rank: .five, suit: .heart))
        cards.append(Card(rank: .five, suit: .clover))
        cards.append(Card(rank: .three, suit: .diamond))
        cards.append(Card(rank: .seven, suit: .spade))
        
        XCTAssert(Hand().checkPair(cards: cards.sorted()) == .twoPair)
        
        cards = [Card]()
        cards.append(Card(rank: .ace, suit: .clover))
        cards.append(Card(rank: .ace, suit: .clover))
        cards.append(Card(rank: .three, suit: .clover))
        cards.append(Card(rank: .five, suit: .heart))
        cards.append(Card(rank: .five, suit: .clover))
        cards.append(Card(rank: .two, suit: .diamond))
        cards.append(Card(rank: .seven, suit: .spade))
        
        XCTAssert(Hand().checkPair(cards: cards.sorted()) == .twoPair)
        
        cards = [Card]()
        cards.append(Card(rank: .queen, suit: .clover))
        cards.append(Card(rank: .jack, suit: .clover))
        cards.append(Card(rank: .three, suit: .clover))
        cards.append(Card(rank: .five, suit: .heart))
        cards.append(Card(rank: .five, suit: .clover))
        cards.append(Card(rank: .two, suit: .diamond))
        cards.append(Card(rank: .seven, suit: .spade))
        
        XCTAssert(Hand().checkPair(cards: cards.sorted()) == .onePair)
        
        cards = [Card]()
        cards.append(Card(rank: .queen, suit: .clover))
        cards.append(Card(rank: .jack, suit: .clover))
        cards.append(Card(rank: .three, suit: .clover))
        cards.append(Card(rank: .king, suit: .heart))
        cards.append(Card(rank: .five, suit: .clover))
        cards.append(Card(rank: .two, suit: .diamond))
        cards.append(Card(rank: .seven, suit: .spade))
        
        XCTAssert(Hand().checkPair(cards: cards.sorted()) == .noPair)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
