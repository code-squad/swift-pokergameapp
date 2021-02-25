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
    
    func testDetectsPair() {
        let cards = [ Card(rank: .eight, suit: .clubs),
                      Card(rank: .eight, suit: .diamonds),
                      Card(rank: .A, suit: .clubs),
                      Card(rank: .J, suit: .hearts),
                      Card(rank: .five, suit: .spades),
                    ]
        let hand = Hand(cards: cards)
        assertHand(hand, .pair)
    }
    
    func testDetectsTwoPair() {
        let cards = [ Card(rank: .eight, suit: .clubs),
                      Card(rank: .eight, suit: .diamonds),
                      Card(rank: .A, suit: .clubs),
                      Card(rank: .A, suit: .hearts),
                      Card(rank: .five, suit: .spades),
                    ]
        let hand = Hand(cards: cards)
        assertHand(hand, .twoPair)
    }
    
    func testDetectsTriple() {
        let cards = [ Card(rank: .eight, suit: .clubs),
                      Card(rank: .eight, suit: .diamonds),
                      Card(rank: .eight, suit: .hearts),
                      Card(rank: .A, suit: .hearts),
                      Card(rank: .five, suit: .spades),
                    ]
        let hand = Hand(cards: cards)
        assertHand(hand, .triple)
    }
    
    func testDetectsStraight() {
        let cards = [ Card(rank: .five, suit: .clubs),
                      Card(rank: .six, suit: .diamonds),
                      Card(rank: .seven, suit: .hearts),
                      Card(rank: .eight, suit: .hearts),
                      Card(rank: .nine, suit: .spades),
                    ]
        let hand = Hand(cards: cards)
        assertHand(hand, .straight)
    }
    
    func testDetectsFourOfAKind() {
        let cards = [ Card(rank: .five, suit: .clubs),
                      Card(rank: .five, suit: .diamonds),
                      Card(rank: .five, suit: .hearts),
                      Card(rank: .five, suit: .spades),
                      Card(rank: .nine, suit: .spades),
                    ]
        let hand = Hand(cards: cards)
        assertHand(hand, .fourOfAKind)
    }
    
    private func assertHand(_ hand: Hand, _ expectedHand: Hand.Kind) {
        let handKind = hand.judge()
        XCTAssertEqual(handKind, expectedHand)
    }
}
