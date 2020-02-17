//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by 임승혁 on 2020/02/13.
//  Copyright © 2020 임승혁. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {
    
    var cardDeck: CardDeck!
    var card: Card!
    var gameTable: GameTable!
    
    override func setUp() {
        gameTable = GameTable(playerCount: 5, studType: 5)
    }

    func testcheckContinueGame() {
        XCTAssertFalse(gameTable.checkEndGame())
    }
    
}
