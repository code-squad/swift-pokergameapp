//
//  PokerGameTest.swift
//  PokerGameTest
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import CardGameApp
import XCTest

class PokerGameTest: XCTestCase {

    var fiveCardStud: PokerGame!
    var sevenCardStud: PokerGame!
    
    override func setUp() {
        super.setUp()
        fiveCardStud = PokerGame(gameType: .fiveCardStud, numberOfPlayers: .two)
        sevenCardStud = PokerGame(gameType: .sevenCardStud, numberOfPlayers: .three)
    }
    
    func testAddPlayers() {
        XCTAssertEqual(fiveCardStud.players.count, 3)
    }
    
    func testDistributeCards() {
        fiveCardStud.distributeCards()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.handCount, 1)
        }
    }
    
    func testFiveCardStud() {
        fiveCardStud.play()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.handCount, 5)
        }
    }
    
    func testSevenCardStud() {
        sevenCardStud.play()
        sevenCardStud.players.forEach {
            XCTAssertEqual($0.handCount, 7)
        }
    }
}
