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
        fiveCardStud = PokerGame(gameType: 5, numberOfPlayers: 2)
        sevenCardStud = PokerGame(gameType: 7, numberOfPlayers: 3)
        
    }
    
    func testAddPlayers() {
        fiveCardStud.addPlayers()
        XCTAssertEqual(fiveCardStud.players.count, 3)
        sevenCardStud.addPlayers()
        XCTAssertEqual(sevenCardStud.players.count, 4)
    }
    
    func testDistributeCards() {
        fiveCardStud.addPlayers()
        fiveCardStud.distributeCards()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 1)
        }
    }
    
    func testInitHand() {
        fiveCardStud.addPlayers()
        fiveCardStud.distributeCards()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 1)
        }
        fiveCardStud.initHand()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 0)
        }

    }
    
    func testGame() {
        fiveCardStud.run()
        fiveCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 5)
        }
        XCTAssertLessThan(fiveCardStud.dealer.deck.count, (fiveCardStud.numberOfPlayers + 1) * fiveCardStud.gameType)
        sevenCardStud.run()
        sevenCardStud.players.forEach {
            XCTAssertEqual($0.hand.count, 7)
        }
        XCTAssertLessThan(sevenCardStud.dealer.deck.count, (sevenCardStud.numberOfPlayers + 1) * sevenCardStud.gameType)
    }
}
