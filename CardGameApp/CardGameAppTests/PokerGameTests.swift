//
//  PokerGameUnitTests.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest
@testable import CardGameApp

class PokerGameTests: XCTestCase {
    
    override func setUp() {
        
    }

    func testSevenCardsStud() {
        let pokerGame = PokerGame(game: .sevenCardsStud, numberOfPlayers: .four)
        
        XCTAssert(pokerGame.players.count == 4)
        pokerGame.players.forEach {
            XCTAssert($0.hands.count == 7)
        }
        
        pokerGame.players.enumerated().forEach { (i, player) in
            print("참가자#\(i+1) \(player.hands)")
        }
        print("딜러 \(pokerGame.dealer.communityCards)")
    }
    
    func testFiveCardsStud() {
        let pokerGame = PokerGame(game: .fiveCardsStud, numberOfPlayers: .three)
        
        XCTAssert(pokerGame.players.count == 3)
        pokerGame.players.forEach {
            XCTAssert($0.hands.count == 5)
        }
        
        pokerGame.players.enumerated().forEach { (i, player) in
            print("참가자#\(i+1) \(player.hands)")
        }
        print("딜러 \(pokerGame.dealer.communityCards)")
    }
}
