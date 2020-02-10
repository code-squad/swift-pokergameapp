//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by Cory Kim on 2020/02/06.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest
import CardGameApp

class CardGameAppTests: XCTestCase {

    var deck: CardDeck!
    
    override func setUp() {
        self.deck = CardDeck()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCardDeckInitializer() {
        print("> 카드 초기화")
        deck = CardDeck()
        print("카드 전체를 초기화했습니다.")
        XCTAssertNotNil(deck)
        XCTAssertEqual(deck.count, 52)
        print("총 \(deck.count)장의 카드가 있습니다.")
    }
    
    func testCardDeckShuffle() {
        print("> 카드 섞기")
        let initializedCards = deck.cards
        deck.shuffle()
        let shuffledCards = deck.cards
        XCTAssertNotEqual(initializedCards, shuffledCards)
        print("전체 52장의 카드를 섞었습니다.")
    }
    
    func testCardDeckRemoveOne() {
        print("> 카드 하나 뽑기")
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
    
    func testSevenCardStud() {
        print("7카드 기준, 참가자 3명일 때")
        let numberOfPlayers = 3
        let gameType: GameType = .sevenCardsStud
        var players: [Player] = []
        
        let cardDeck = CardDeck()
        cardDeck.shuffle()
        
        for _ in 0..<numberOfPlayers {
            players.append(Player())
        }
        
        players.forEach {
            for _ in 0..<gameType.rawValue {
                guard let card = cardDeck.removeOne() else { return }
                $0.hands.append(card)
            }
        }
        
        players.forEach({ print($0.hands) })
    }
}
