//
//  RankTests.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/03/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import CardGameApp

class RankTests: XCTestCase {
    
    func testIsFourCardSuccess() {
        // 1.given
        let cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .four),
                     Card(suit: .spade, number: .four)]
        // 3.then
        XCTAssertGreaterThan(Participant.Rank.isFourCard(cards: cards), 0)
    }
    
    func testIsFourCardFail() {
        // 1.given
        let cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .four)]
        XCTAssertEqual(Participant.Rank.isFourCard(cards: cards), 0)
    }
}
