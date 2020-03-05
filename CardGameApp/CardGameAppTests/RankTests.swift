//
//  RankTests.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/03/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import CardGameApp

class RankTests: XCTestCase {
    
    func testIsFourCardSuccess() {
        // 1. given
        let cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .four),
                     Card(suit: .spade, number: .four)]
        // 3. then
        let ranks = Ranks(cards: cards)
    }
    
    func testIsFourCardFail() {
        // 1. given
        let cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .four)]
         // 3. then
    }
    
    func testIsStraightSuccess() {
        // 1. given
        let cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .five),
                     Card(suit: .heart, number: .four),
                     Card(suit: .spade, number: .four)]
         // 3. then
        
    }
    
    func testIsStraightFail() {
        // 1. given
        var cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .five),
                     Card(suit: .heart, number: .six),
                     Card(suit: .spade, number: .seven)]
         // 3. then
        
        
        // 1. given
        cards = [Card(suit: .club, number: .ace),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .three),
                     Card(suit: .club, number: .five),
                     Card(suit: .diamond, number: .five),
                     Card(suit: .heart, number: .six),
                     Card(suit: .spade, number: .seven)]
         // 3. then
        
    }
    
    func testIsTripleSuccess() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .ace),
                     Card(suit: .spade, number: .five)]
        
         // 3. then
        
    }

    func testIsTripleFail() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .four),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .ace),
                     Card(suit: .spade, number: .five)]
         // 3. then
        
    }
    
    func testIsTwoPairSuccess() {
        // 1. given
        let cards = [Card(suit: .club, number: .four),
                      Card(suit: .club, number: .four),
                      Card(suit: .club, number: .two),
                      Card(suit: .diamond, number: .two),
                      Card(suit: .heart, number: .three),
                      Card(suit: .spade, number: .three),
                      Card(suit: .spade, number: .queen)]
          // 3. then
        
    }
    
    func testIsTwoPairFail() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .three),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .five),
                     Card(suit: .spade, number: .six)]
         // 3. then
        
    }
    
    func testIsOnePairSuccess() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .two),
                     Card(suit: .club, number: .three),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .five),
                     Card(suit: .spade, number: .six)]
        
        // 3. then
        
    }
    
    func testIsOnePairFail() {
        // 1. given
        let cards = [Card(suit: .club, number: .two),
                     Card(suit: .club, number: .jack),
                     Card(suit: .club, number: .three),
                     Card(suit: .diamond, number: .four),
                     Card(suit: .heart, number: .five),
                     Card(suit: .spade, number: .six)]
        
        // 3. then
       
    }
    
    func testIsOneCardSuccess() {
        // 1. given
        var cards = [Card(suit: .club, number: .ace),
                     Card(suit: .diamond, number: .queen),
                     Card(suit: .heart, number: .three)]
        
        
    }
    
}
