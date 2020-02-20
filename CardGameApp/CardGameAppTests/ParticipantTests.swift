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
    
    func testParticipantTakesACard() {
        let participant = Participant()
        participant.take(card: Card(suit: .club, rank: .ace))
        XCTAssertEqual(participant.repeatForEachCard { $0 }.count, 1)
    }
    
}
