//
//  DeckTest.swift
//  DeckTest
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import CardGameApp
import XCTest

class DeckTest: XCTestCase {

    var deck: Deck!
    
    override func setUp() {
        super.setUp()
        deck = Deck()
    }
    
    func testShuffle() {
        let beforeShuffle = deck
        var isItDifferent = 0
        for _ in 1...100 {
            deck.shuffle()
            if deck != beforeShuffle {
                isItDifferent += 1
            } else {
                isItDifferent -= 1
            }
        }
        XCTAssertGreaterThan(isItDifferent, 0)
    }
    
    func testReset() {
        var anotherDeck = Deck()
        deck.reset()
        anotherDeck.reset()
        XCTAssertEqual(deck, anotherDeck)
    }
    
    func testRemoveOneAndCount() {
        let beforeRemove = deck.count
        for count in 1...beforeRemove {
            if let card = deck.removeOne() {
                print(card)
                XCTAssertEqual(beforeRemove - count, deck.count)
            }
        }
        XCTAssertNil(deck.removeOne())
    }

}
