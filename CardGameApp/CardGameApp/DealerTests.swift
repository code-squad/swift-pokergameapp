//
//  DealerTests.swift
//  CardGameAppTests
//
//  Created by Viet on 2020/02/11.
//  Copyright © 2020 Viet. All rights reserved.
//

import XCTest

class DealerTests: XCTestCase {
    var deck: Deck!
    var dealer: Dealer!
    
    override func setUp() {
        self.deck = DeckFactory.create()
        self.dealer = Dealer(deck: deck)
    }
    
    func testDealCard() {
        let players = [Player(), Player(), Player(), Player()]
        let card = deck.removeOne()!
        let player = players.first!
        
        dealer.give(card: card, to: player)
        
        XCTAssertEqual(player.cards.count, 1)
    }
    
    func testPrepareGame() {
        let numberOfAllCards = 52
        self.dealer.prepare()
        XCTAssertEqual(dealer.deck.count, numberOfAllCards)
    }
    
    // 7 stud
    func testStartGame() {
        let numberOfCardsByRule = 7
        let players = [Player(), Player(), Player(), Player()]
        
        dealer.prepare()
        dealer.startGame(players: players)
        
        print(dealer.cards)
        XCTAssertEqual(dealer.cards.count, numberOfCardsByRule)
        
        let receivedCorrectly = players.filter { player in
            print(player.cards)
            return player.cards.count == numberOfCardsByRule
        }
        
        XCTAssertEqual(receivedCorrectly.count, players.count)
        
    }
}
