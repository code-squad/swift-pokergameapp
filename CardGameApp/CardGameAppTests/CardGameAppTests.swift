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
    
    func testPlayer(){
        let player = Player()
        player.receiveCard(card: Card(rank: .ace, suit: .clover))
        XCTAssert(player.getCardCount() == 1)
    }
    
    func testGameStart(){
        let pokerGame = PokerGame()
        pokerGame.gameStart()
        XCTAssertNotNil(pokerGame.getDealer)
        XCTAssertNotNil(pokerGame.getPlayers)
        XCTAssertGreaterThan(pokerGame.getPlayers().count,0)
    }
    
    func testSetGameStyle(){
        let pokerGame = PokerGame()
        let beforeChangedStud = pokerGame.getStud()
        pokerGame.setGameStyle(stud: .fiveCardStud, numOfPlayer: pokerGame.getNumOfPlayer())
        XCTAssertNotEqual(beforeChangedStud, pokerGame.getStud())
        
        let beforeChangedNOP = pokerGame.getNumOfPlayer()
        pokerGame.setGameStyle(stud: pokerGame.getStud(), numOfPlayer: .one)
        XCTAssertNotEqual(beforeChangedNOP, pokerGame.getNumOfPlayer())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
