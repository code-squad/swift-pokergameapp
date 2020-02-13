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
        
        willCompareCards = [
            Card(suit: .club, rank: .one),
            Card(suit: .club, rank: .two),
            Card(suit: .club, rank: .three),
            Card(suit: .club, rank: .four),
            Card(suit: .club, rank: .five),
            Card(suit: .club, rank: .six),
            Card(suit: .club, rank: .seven),
            Card(suit: .club, rank: .eight),
            Card(suit: .club, rank: .nine),
            Card(suit: .club, rank: .ten),
            Card(suit: .club, rank: .eleven),
            Card(suit: .club, rank: .twelve),
            Card(suit: .club, rank: .thirteen),
        ]
        
        willCompareSuits = [
        Card(suit: .diamond, rank: .one),
        Card(suit: .diamond, rank: .two),
        Card(suit: .diamond, rank: .three),
        Card(suit: .diamond, rank: .four),
        Card(suit: .diamond, rank: .five),
        Card(suit: .diamond, rank: .six),
        Card(suit: .diamond, rank: .seven),
        Card(suit: .diamond, rank: .eight),
        Card(suit: .diamond, rank: .nine),
        Card(suit: .diamond, rank: .ten),
        Card(suit: .diamond, rank: .eleven),
        Card(suit: .diamond, rank: .twelve),
        Card(suit: .diamond, rank: .thirteen),
        Card(suit: .heart, rank: .one),
        Card(suit: .heart, rank: .two),
        Card(suit: .heart, rank: .three),
        Card(suit: .heart, rank: .four),
        Card(suit: .heart, rank: .five),
        Card(suit: .heart, rank: .six),
        Card(suit: .heart, rank: .seven),
        Card(suit: .heart, rank: .eight),
        Card(suit: .heart, rank: .nine),
        Card(suit: .heart, rank: .ten),
        Card(suit: .heart, rank: .eleven),
        Card(suit: .heart, rank: .twelve),
        Card(suit: .heart, rank: .thirteen),
        Card(suit: .spade, rank: .one),
        Card(suit: .spade, rank: .two),
        Card(suit: .spade, rank: .three),
        Card(suit: .spade, rank: .four),
        Card(suit: .spade, rank: .five),
        Card(suit: .spade, rank: .six),
        Card(suit: .spade, rank: .seven),
        Card(suit: .spade, rank: .eight),
        Card(suit: .spade, rank: .nine),
        Card(suit: .spade, rank: .ten),
        Card(suit: .spade, rank: .eleven),
        Card(suit: .spade, rank: .twelve),
        Card(suit: .spade, rank: .thirteen),
        ]
        
        willCompareSuits.append(contentsOf: willCompareCards)
        
        
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
    
//    func testMakeSuit() {
//        let cards = deck?.makeSuit(suit: .club)
//        XCTAssertEqual(cards, willCompareCards)
//    }
//    
//    func testMakeDeck() {
//        deck?.makeDeck()
//        XCTAssertEqual(deck?.cards, willCompareSuits)
//    }
    
    func testGame() {
        var game = Game(person: 3, style: .five)
        var dealer = Dealer(game: game)
        dealer.pushGame { (ggame) in
            ggame.takeInformation { (gamer, style) in
                XCTAssertEqual(gamer.count, 3)
                XCTAssertEqual(style, Game.Style.five)
            }
        }
        
        game = Game(person: 4, style: .seven)
        dealer = Dealer(game: game)
        dealer.pushGame { (ggame) in
             ggame.takeInformation { (gamer, style) in
                 XCTAssertEqual(gamer.count, 4)
                 XCTAssertEqual(style, Game.Style.seven)
             }
         }
    }
}
