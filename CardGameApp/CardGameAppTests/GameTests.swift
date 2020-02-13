//
//  GameTests.swift
//  CardGameAppTests
//
//  Created by Viet on 2020/02/11.
//  Copyright © 2020 Viet. All rights reserved.
//

import XCTest

class GameTests: XCTestCase {
    func testCreatePlayers() {
        XCTAssertThrowsError(try CardGameFactory.createPlayers(count: 0))
        XCTAssertNoThrow(try CardGameFactory.createPlayers(count: 1))
        XCTAssertNoThrow(try CardGameFactory.createPlayers(count: 5))
    }
    
    func testCreateGame() {
        var players = try! CardGameFactory.createPlayers(count: 5)
        XCTAssertThrowsError(try Game(rule: .fiveStud, players: players))
        players = try! CardGameFactory.createPlayers(count: 3)
        XCTAssertNoThrow(try Game(rule: .fiveStud, players: players))
    }
    
    func testStartGame() {
        let players = try! CardGameFactory.createPlayers(count: 4)
        let game = try! Game(rule: .fiveStud, players: players)
        
        game.start()
        let cardsPerPlayer = players.map { $0.cards.count }

        XCTAssertEqual(cardsPerPlayer, [Int](repeating: 7, count: 4))
    }
}

