//
//  PlayersTests.swift
//  CardGameAppTests
//
//  Created by Chaewan Park on 2020/02/21.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import CardGameApp

class PlayersTests: XCTestCase {

    var players: Players!
    
    override func setUp() {
        players = Players(with: .four)
    }
    
    func testTheHighestFourCard() {
        let scores = [Score.straight(highestCard: Card(suit: .club, rank: .eight)),
                      Score.fourOfAKind(highestCard: Card(suit: .diamond, rank: .six)),
                      Score.straight(highestCard: Card(suit: .heart, rank: .ace))]
        let (highestScore, highestCard) = players.theHighest(in: scores)
        
        let expectedHighestScore = Score.fourOfAKind(highestCard: Card(suit: .club, rank: .ace))
        let expectedHighesctCard = Card(suit: .heart, rank: .six)
        
        XCTAssertTrue(highestScore.isSamePriority(with: expectedHighestScore))
        XCTAssertEqual(highestCard, expectedHighesctCard)
    }
    
    func testTheHighestCardWhenStraight() {
        let scores = [Score.straight(highestCard: Card(suit: .club, rank: .eight)),
                      Score.straight(highestCard: Card(suit: .diamond, rank: .six)),
                      Score.straight(highestCard: Card(suit: .heart, rank: .ace))]
        let (highestScore, highestCard) = players.theHighest(in: scores)
        
        let expectedHighestScore = Score.straight(highestCard: Card(suit: .club, rank: .ace))
        let expectedHighesctCard = Card(suit: .heart, rank: .eight)
        
        XCTAssertTrue(highestScore.isSamePriority(with: expectedHighestScore))
        XCTAssertEqual(highestCard, expectedHighesctCard)
    }
    
    func testDuplicatedHighestScore() {
        let scores = [Score.twoPairs(highestCard: Card(suit: .club, rank: .six)),
                      Score.twoPairs(highestCard: Card(suit: .diamond, rank: .six)),
                      Score.highcard(highestCard: Card(suit: .heart, rank: .ace))]
        let (highestScore, highestCard) = players.theHighest(in: scores)
        
        let expectedHighestScore = Score.twoPairs(highestCard: Card(suit: .club, rank: .ace))
        let expectedHighesctCard = Card(suit: .heart, rank: .six)
        
        XCTAssertTrue(highestScore.isSamePriority(with: expectedHighestScore))
        XCTAssertEqual(highestCard, expectedHighesctCard)
    }
    
    func testTheHighestPair() {
        let scores = [Score.pair(highestCard: Card(suit: .club, rank: .eight)),
                      Score.highcard(highestCard: Card(suit: .diamond, rank: .six)),
                      Score.highcard(highestCard: Card(suit: .heart, rank: .ace))]
        let (highestScore, highestCard) = players.theHighest(in: scores)
        
        let expectedHighestScore = Score.pair(highestCard: Card(suit: .club, rank: .ace))
        let expectedHighesctCard = Card(suit: .heart, rank: .eight)
        
        XCTAssertTrue(highestScore.isSamePriority(with: expectedHighestScore))
        XCTAssertEqual(highestCard, expectedHighesctCard)
    }
    
    func testTheHighestCardWhenHighcard() {
        let scores = [Score.highcard(highestCard: Card(suit: .club, rank: .eight)),
                      Score.highcard(highestCard: Card(suit: .diamond, rank: .six)),
                      Score.highcard(highestCard: Card(suit: .heart, rank: .ace))]
        let (highestScore, highestCard) = players.theHighest(in: scores)
        
        let expectedHighestScore = Score.highcard(highestCard: Card(suit: .club, rank: .ace))
        let expectedHighesctCard = Card(suit: .heart, rank: .eight)
        
        XCTAssertTrue(highestScore.isSamePriority(with: expectedHighestScore))
        XCTAssertEqual(highestCard, expectedHighesctCard)
    }
}
