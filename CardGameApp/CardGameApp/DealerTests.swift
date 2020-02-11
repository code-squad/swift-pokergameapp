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

        dealer.give(card: card, to: players.first!)
    }
    
    func testPrepareGame() {
        self.dealer.prepare()
    }
    
    // 7 stud
    func testStartGame() {
        let players = [Player(), Player(), Player(), Player()]
        dealer.startGame(players: players)
        
    }
}
