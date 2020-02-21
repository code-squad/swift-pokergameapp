//
//  ParticipantTests.swift
//  CardGameAppTests
//
//  Created by Chaewan Park on 2020/02/20.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import CardGameApp

class ParticipantTests: XCTestCase {
    
    var participant: Participant!
    
    override func setUp() {
        participant = Participant()
    }
    
    func testParticipantTakesACard() {
        participant.take(card: Card(suit: .club, rank: .ace))
        XCTAssertEqual(participant.repeatForEachCard { $0 }.count, 1)
    }
    
    func testScoreStraight() {
        participant.take(card: Card(suit: .diamond, rank: .two))
        participant.take(card: Card(suit: .club, rank: .five))
        participant.take(card: Card(suit: .heart, rank: .six))
        participant.take(card: Card(suit: .club, rank: .three))
        participant.take(card: Card(suit: .spade, rank: .four))
        let expectedScore = Score.straight(highestCard: Card(suit: .heart, rank: .six))
        XCTAssertEqual(participant.score(), expectedScore)
    }
    
    func testScoreFourOfAKind() {
        participant.take(card: Card(suit: .heart, rank: .jack))
        participant.take(card: Card(suit: .diamond, rank: .jack))
        participant.take(card: Card(suit: .spade, rank: .jack))
        participant.take(card: Card(suit: .club, rank: .jack))
        participant.take(card: Card(suit: .diamond, rank: .jack))
        let expectedScore = Score.fourOfAKind(highestCard: Card(suit: .heart, rank: .jack))
        XCTAssertEqual(participant.score(), expectedScore)
    }
    
    func testScoreThreeOfAKind() {
        participant.take(card: Card(suit: .heart, rank: .seven))
        participant.take(card: Card(suit: .diamond, rank: .ace))
        participant.take(card: Card(suit: .spade, rank: .jack))
        participant.take(card: Card(suit: .club, rank: .ace))
        participant.take(card: Card(suit: .diamond, rank: .jack))
        participant.take(card: Card(suit: .club, rank: .jack))
        participant.take(card: Card(suit: .diamond, rank: .ten))
        let expectedScore = Score.threeOfAKind(highestCard: Card(suit: .heart, rank: .jack))
        XCTAssertEqual(participant.score(), expectedScore)
    }
    
    func testScoreTwoPairs() {
        participant.take(card: Card(suit: .heart, rank: .ten))
        participant.take(card: Card(suit: .diamond, rank: .jack))
        participant.take(card: Card(suit: .spade, rank: .jack))
        participant.take(card: Card(suit: .club, rank: .six))
        participant.take(card: Card(suit: .diamond, rank: .six))
        let expectedScore = Score.twoPairs(highestCard: Card(suit: .heart, rank: .jack))
        XCTAssertEqual(participant.score(), expectedScore)
    }
    
    func testScorePair() {
        participant.take(card: Card(suit: .club, rank: .ace))
        participant.take(card: Card(suit: .diamond, rank: .jack))
        participant.take(card: Card(suit: .club, rank: .jack))
        participant.take(card: Card(suit: .diamond, rank: .ten))
        participant.take(card: Card(suit: .diamond, rank: .king))
        let expectedScore = Score.pair(highestCard: Card(suit: .heart, rank: .jack))
        XCTAssertEqual(participant.score(), expectedScore)
    }
    
    func testScoreHighcard() {
        participant.take(card: Card(suit: .heart, rank: .seven))
        participant.take(card: Card(suit: .diamond, rank: .ace))
        participant.take(card: Card(suit: .spade, rank: .jack))
        participant.take(card: Card(suit: .club, rank: .six))
        participant.take(card: Card(suit: .diamond, rank: .king))
        let expectedScore = Score.highcard(highestCard: Card(suit: .spade, rank: .king))
        XCTAssertEqual(participant.score(), expectedScore)
    }
    
    func testScoreNone() {
        participant.take(card: Card(suit: .diamond, rank: .jack))
        participant.take(card: Card(suit: .spade, rank: .jack))
        let expectedScore = Score.pair(highestCard: Card(suit: .spade, rank: .jack))
        XCTAssertEqual(participant.score(), expectedScore)
    }
    
    func testScoreWhenNoCard() {
        XCTAssertEqual(participant.score(), Score.none)
    }
}
