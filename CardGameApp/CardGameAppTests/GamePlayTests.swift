//
//  GamePlayTests.swift
//  CardGameAppTests
//
//  Created by Chaewan Park on 2020/02/10.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import CardGameApp

class GamePlayTests: XCTestCase {
    
    func testSevenCardStudDealing() {
        let gamePlay = GamePlay(rule: .sevenCardStud, numberOfPlayers: .four)
        gamePlay.deal()
        
        XCTAssertEqual(gamePlay.players.count, 4)
        gamePlay.players.forEach { XCTAssertEqual($0.cards.count, 7) }
        XCTAssertEqual(gamePlay.dealer.cards.count, 7)
    }
    
    func testFiveCardStudDealing() {
        let gamePlay = GamePlay(rule: .fiveCardStud, numberOfPlayers: .two)
        gamePlay.deal()
        
        XCTAssertEqual(gamePlay.players.count, 2)
        gamePlay.players.forEach { XCTAssertEqual($0.cards.count, 5) }
        XCTAssertEqual(gamePlay.dealer.cards.count, 5)
    }
}
