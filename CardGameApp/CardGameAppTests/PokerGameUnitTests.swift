//
//  PokerGameUnitTests.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/10.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest
@testable import CardGameApp

class PokerGameUnitTests: XCTestCase {
    
    override func setUp() {
        
    }

    func testSevenCardsStud() {
        let pokerGame = PokerGame(type: .sevenCardsStud, numberOfPlayers: 3)
        
        pokerGame.players.enumerated().forEach { (i, player) in
            print("참가자#\(i+1) \(player.hands)")
        }
        print("딜러 \(pokerGame.dealer.communityCards)")
    }
    
    func testFiveCardsStud() {
        let pokerGame = PokerGame(type: .fiveCardsStud, numberOfPlayers: 4)
        
        pokerGame.players.enumerated().forEach { (i, player) in
            print("참가자#\(i+1) \(player.hands)")
        }
        print("딜러 \(pokerGame.dealer.communityCards)")
    }
}
