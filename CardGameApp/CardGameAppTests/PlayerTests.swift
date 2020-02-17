//
//  PlayerTests.swift
//  CardGameAppTests
//
//  Created by Viet on 2020/02/17.
//  Copyright © 2020 Viet. All rights reserved.
//

import XCTest

class PlayerTests: XCTestCase {
    func testCreatePlayers() {
        XCTAssertThrowsError(try Player.create(count: 0))
        XCTAssertNoThrow(try Player.create(count: 1))
        XCTAssertNoThrow(try Player.create(count: 5))
    }
}
