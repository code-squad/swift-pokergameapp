//
//  PokerGameAppTests.swift
//  PokerGameAppTests
//
//  Created by zombietux on 2021/02/16.
//

import XCTest
@testable import PokerGameApp

class PokerGameAppTests: XCTestCase {
    
    var cardDeck = CardDeck()
    
    func testGenerateCardDeck() {
        let resetCardDeck = CardDeckGenerator.generate()
        
        XCTAssertEqual(52, resetCardDeck.count)
    }
    
    func testShuffled() {
        var cardDeckToShuffle = CardDeck()
        cardDeckToShuffle.shuffle()
    
        XCTAssertNotEqual(cardDeck, cardDeckToShuffle)
    }
    
    func testRemoveOne() {
        cardDeck.removeOne()
        XCTAssertEqual(51, cardDeck.count())
        cardDeck.removeOne()
        XCTAssertEqual(50, cardDeck.count())
    }
    
    func testPokerGamePlayers() {
        let pokerGame = PokerGame()
        pokerGame.start(gameMode: .sevenStud, NumberOfPlayer: 3)
        let dealerInfo = pokerGame.showDealerInfo()
        let firstPlayerInfo = pokerGame.showPlayersInfo().first
        let lastPlayerInfo = pokerGame.showPlayersInfo().last
        
        XCTAssertEqual("딜러", dealerInfo.showNameInfo())
        XCTAssertEqual("참가자1", firstPlayerInfo?.showNameInfo())
        XCTAssertEqual("참가자3", lastPlayerInfo?.showNameInfo())
    }
}
