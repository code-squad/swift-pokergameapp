//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by Cloud on 2020/02/12.
//  Copyright © 2020 Cloud. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {

    var deck: Deck?
    var willCompareCards: [Card] = []
    var willCompareSuits: [Card] = []
    
    override func setUp() {
        deck = Deck()
    }

    func testCount() {
        XCTAssertEqual(deck?.count, 52)
    }
    
    func testShuffle() {
        deck?.shuffle()
        XCTAssertFalse(deck == Deck())
    }
    
    func testRemoveOne() {
        XCTAssertEqual(deck?.removeOne(), Card(suit: .diamond, rank: .thirteen))
    }
    
    func testRest() {
        deck?.shuffle()
        deck?.reset()
        XCTAssertEqual(deck, Deck())
    }
    
    //
    func testGame() {
        let toozi = Gamer(identifier: "tooozi")
        let gangwoon = Gamer(identifier: "GangWoon")
        var player = Players()
        player.addGamers(gamer: toozi)
        player.addGamers(gamer: gangwoon)
        
        let game = Game.fiveCardStud(gamers: player)
        game.pirntCards()
        
        XCTAssertEqual(game.gamersCount, 3)
    }
}
