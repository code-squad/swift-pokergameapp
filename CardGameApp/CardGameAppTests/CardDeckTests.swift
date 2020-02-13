//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by Cory Kim on 2020/02/06.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardDeckTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCardDeckInitializer() {
        print("> 카드 초기화")
        let deck = Deck()
        print("카드 전체를 초기화했습니다.")
        XCTAssertNotNil(deck)
        XCTAssertEqual(deck.count, 52)
        print("총 \(deck.count)장의 카드가 있습니다.")
    }
    
    func testCardDeckShuffle() {
        print("> 카드 섞기")
        var deck = Deck()
        let initializedDeck = deck
        deck.shuffle()
        XCTAssertNotEqual(initializedDeck, deck)
        print("전체 52장의 카드를 섞었습니다.")
    }
    
    func testCardDeckRemoveOne() {
        print("> 카드 하나 뽑기")
        var deck = Deck()
        deck.shuffle()
        
        guard let card1 = deck.removeOne() else { return }
        print(card1)
        XCTAssertEqual(deck.count, 51)
        print("총 \(deck.count)장의 카드가 남아있습니다.\n")
        
        guard let card2 = deck.removeOne() else { return }
        print(card2)
        XCTAssertEqual(deck.count, 50)
        print("총 \(deck.count)장의 카드가 남아있습니다.\n")
    }
}
