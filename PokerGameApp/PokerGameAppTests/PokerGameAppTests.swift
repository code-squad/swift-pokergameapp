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
        let pokerGame = PokerGame.start(gameMode: .sevenStud, NumberOfPlayer: 3)
        let dealerInfo = pokerGame.dealerInfo
        let firstPlayerInfo = pokerGame.playersInfo.first
        let lastPlayerInfo = pokerGame.playersInfo.last
        
        XCTAssertEqual("딜러", dealerInfo.nameInfo)
        XCTAssertEqual("참가자1", firstPlayerInfo?.nameInfo)
        XCTAssertEqual("참가자3", lastPlayerInfo?.nameInfo)
    }
}
