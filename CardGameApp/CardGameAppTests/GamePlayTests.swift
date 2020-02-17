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
    
    var cardDeck: CardDeck!
    
    override func setUp() {
        cardDeck = CardDeck()
    }
    
    func testParticipantTakesACard() {
        let participant = Participant()
        participant.take(card: Card(suit: .club, rank: .ace))
        XCTAssertEqual(participant.repeatForEachCard { $0 }.count, 1)
    }
    
    func testPlayersEntrance() {
        let numberOfPlayers = Players.Number.four
        let expectedPlayers = (0..<4).map { _ in Participant() }
        XCTAssertEqual(numberOfPlayers.invokePerPlayerCount { Participant() }, expectedPlayers)
    }
    
    func testEachPlayerTakesACard() {
        let players = Players(with: .three)
        var cardDeck = CardDeck()
        players.repeatForEachPlayer { $0.take(card: cardDeck.removeOne()) }
        let cards = players.repeatForEachPlayer { $0.repeatForEachCard { $0 } }
        
        XCTAssertEqual(cards.count, 3)
        XCTAssertEqual(cards.map { $0.count }, [1, 1, 1])
    }
    
    func testSevenCardStudGamePlayDealing() {
        let gamePlay = GamePlay(rule: .sevenCardStud, numberOfPlayers: .two, cardDeck: cardDeck)
        gamePlay.deal()
        let table = gamePlay.table()
        
        XCTAssertEqual(table.count, 3)
        XCTAssertEqual(table.map { $0.count }, [7, 7, 7])
    }

    func testFiveCardStudGamePlayDealing() {
        let gamePlay = GamePlay(rule: .fiveCardStud, numberOfPlayers: .three, cardDeck: cardDeck)
        gamePlay.deal()
        let table = gamePlay.table()
        
        XCTAssertEqual(table.count, 4)
        XCTAssertEqual(table.map { $0.count }, [5, 5, 5, 5])
    }
}
