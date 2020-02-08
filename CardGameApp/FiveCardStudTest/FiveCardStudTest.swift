//
//  FiveCardStudTest.swift
//  FiveCardStudTest
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import CardGameApp
import XCTest

class FiveCardStudTest: XCTestCase {

    var game: FiveCardStud!
    
    override func setUp() {
        super.setUp()
        game = FiveCardStud(numberOfPlayer: 3)
    }
    
    func testAddPlayers() {
        game.addPlayers()
        XCTAssertEqual(game.players.count, 4)
        game = FiveCardStud(numberOfPlayer: 1)
        game.addPlayers()
        XCTAssertEqual(game.players.count, 2)
    }
    
    func testDistributeCards() {
        game.addPlayers()
        game.distributeCards()
        game.players.forEach {
            XCTAssertEqual($0.hand.count, 1)
        }
    }
    
    func testGame() {
        game.run()
        game.players.forEach {
            XCTAssertEqual($0.hand.count, 5)
        }
    }
}
