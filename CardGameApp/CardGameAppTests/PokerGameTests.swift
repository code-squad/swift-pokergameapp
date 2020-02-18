//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by JW on 2020/02/11.
//  Copyright © 2020 JW. All rights reserved.
//

import XCTest
@testable import CardGameApp

class PokerGameTests: XCTestCase {
    
    var pokerGame: PokerGame!
    var participants: [Participant] = []
    
    override func setUp() {
        super.setUp()
        self.pokerGame = PokerGame(gameMode: .sevenCardStud, playerMode: .four)
        self.participants = pokerGame.showParticipants()
    }

    func testPokerGameInitialize() {
        let participantCount = Mode.PlayerMode.four.rawValue
        
        XCTAssertEqual(self.participants.count, participantCount)
    }

    func testGiveCards() {
        pokerGame.giveCards()
        let randomIndex = Int.random(in: 0..<self.participants.count)
        var anotherRandomIndex = Int.random(in: 0..<self.participants.count)
        while anotherRandomIndex == randomIndex {
            anotherRandomIndex = Int.random(in: 0..<self.participants.count)
        }
        
        let participantCards = self.participants[randomIndex].statusOfRoleAndCards().cards
        let anotherParticipantCards = self.participants[anotherRandomIndex].statusOfRoleAndCards().cards
        
        XCTAssertNotEqual(participantCards, anotherParticipantCards)
        
        let dealerCards = pokerGame.showDealer().statusOfRoleAndCards().cards
        
        XCTAssertNotEqual(participantCards, dealerCards)
    }

}
