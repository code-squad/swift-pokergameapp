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

    func testSevenCardsStud() {
        let pokerGame = PokerGame(game: .sevenCardsStud, numberOfPlayers: .three)
        var hands: [[Card]] = []
        
        pokerGame.resetPlayers()
        GameType.sevenCardsStud.forEachCard {
            pokerGame.passCards { (_) in
            }
        }
        pokerGame.forEachPlayer { (player) in
            hands.append(player.hand.cards)
        }
        
        XCTAssert(hands.count == 4)
        hands.forEach { (hand) in
            XCTAssert(hand.count == 7)
        }
    }
    
    func testFiveCardsStud() {
        let pokerGame = PokerGame(game: .fiveCardsStud, numberOfPlayers: .four)
        var hands: [[Card]] = []
        
        pokerGame.resetPlayers()
        GameType.fiveCardsStud.forEachCard {
            pokerGame.passCards { (_) in
            }
        }
        pokerGame.forEachPlayer { (player) in
            hands.append(player.hand.cards)
        }
        
        XCTAssert(hands.count == 5)
        hands.forEach { (hand) in
            XCTAssert(hand.count == 5)
        }
    }
}
