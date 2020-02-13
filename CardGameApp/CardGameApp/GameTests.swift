//
//  GameTests.swift
//  CardGameAppTests
//
//  Created by Viet on 2020/02/11.
//  Copyright © 2020 Viet. All rights reserved.
//

import XCTest

class GameTests: XCTestCase {
    func testCreateGame() {
        XCTAssertThrowsError(try Game(rule: .fiveStud, numberOfPlayers: 5))
        XCTAssertThrowsError(try Game(rule: .fiveStud, numberOfPlayers: 0))
        XCTAssertNoThrow(try Game(rule: .fiveStud, numberOfPlayers: 3))
    }
    
    func testStartGame() {
        let game = try! Game(rule: .fiveStud, numberOfPlayers: 4)
        game.start()
    }
}

