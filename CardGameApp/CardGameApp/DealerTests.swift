//
//  DealerTests.swift
//  CardGameAppTests
//
//  Created by Viet on 2020/02/11.
//  Copyright © 2020 Viet. All rights reserved.
//

import XCTest

class DealerTests: XCTestCase {
    func testDealCard() {
        let dealer = Dealer()
        let player = Player()
        var deck = DeckFactory.create()
        let card = deck.removeOne()!

        dealer.deal(card, to: player)
    }
}
