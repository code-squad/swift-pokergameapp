//
//  PokerGameTest.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//
import XCTest
@testable import CardGameApp
class PokerGameTests: XCTestCase {
    var game: PokerGame!
    let correctStutNum = 5
    let correctPlayersNum = 1
    
    override func setUp() {
        game = try! PokerGame(gameStutNumber: correctStutNum,
                              playersNumber: correctPlayersNum)
        super.setUp()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func testInitiateForGameStutNumber() {
        // wrong cases
        let wrongNumber = 3
        game = try? PokerGame(gameStutNumber: wrongNumber,
                              playersNumber: correctPlayersNum)
        XCTAssertNil(game)
        
        
        // correct cases
        let correctNumberFive = 5
        game = try? PokerGame(gameStutNumber: correctNumberFive,
                              playersNumber: correctPlayersNum)
        XCTAssertNotNil(game)
        
        let correctNumberSeven = 7
        game = try? PokerGame(gameStutNumber: correctNumberSeven,
                              playersNumber: correctPlayersNum)
        
        XCTAssertNotNil(game)
    }
    
    func testInitateForPlayersNumber() {
        // wrong cases
        let wrongNumberZero = 0
        game = try? PokerGame(gameStutNumber: correctStutNum,
                              playersNumber: wrongNumberZero)
        XCTAssertNil(game)
        
        let wrongNumberFive = 5
        game = try? PokerGame(gameStutNumber: correctStutNum,
                              playersNumber: wrongNumberFive)
        XCTAssertNil(game)
        
        // correct cases
        for num in 1 ..< wrongNumberFive {
            game = try? PokerGame(gameStutNumber: correctStutNum,
                                  playersNumber: num)
            XCTAssertNotNil(game)
        }
    }
    
}
