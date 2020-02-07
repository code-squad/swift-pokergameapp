//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by delma on 07/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
       
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCardShuffle() {
        let cardDeck = CardDeck()
        let output = """
            > 카드 섞기
            전체 \(cardDeck.count())장의 카드를 섞었습니다.
            """
        print(output)
    }
    func testInitCard() {
         let cardDeck = CardDeck()
        print("> 카드 초기화\n카드 전체를 초기화했습니다.\n총 \(cardDeck.count())장의 카드를 섞었습니다.")
    }
    
    func testPickOneCard() {
        var cardDeck = CardDeck()
        let output = """
        > 카드 하나 뽑기
        \(cardDeck.removeOn())
        총 \(cardDeck.count())장의 카드가 남아있습니다.
        """
        print(output)
    }
    
}
