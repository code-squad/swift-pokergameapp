//
//  VersusTest.swift
//  VersusTest
//
//  Created by TTOzzi on 2020/02/18.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import CardGameApp
import XCTest

class VersusTest: XCTestCase {

    var player1: Player!
    var player2: Player!
    
    override func setUp() {
        super.setUp()
        player1 = Player()
        player2 = Player()
    }

    func testSameStraights() {
        // 45678 스트레이트
        player1.receive(Card(shape: .heart, rank: .A))
        player1.receive(Card(shape: .clover, rank: .four))
        player1.receive(Card(shape: .diamond, rank: .seven))
        player1.receive(Card(shape: .spade, rank: .six))
        player1.receive(Card(shape: .heart, rank: .five))
        player1.receive(Card(shape: .diamond, rank: .eight))
        player1.receive(Card(shape: .clover, rank: .J))
        
        // 56789 스트레이트
        player2.receive(Card(shape: .clover, rank: .five))
        player2.receive(Card(shape: .spade, rank: .eight))
        player2.receive(Card(shape: .diamond, rank: .nine))
        player2.receive(Card(shape: .clover, rank: .six))
        player2.receive(Card(shape: .diamond, rank: .A))
        player2.receive(Card(shape: .heart, rank: .seven))
        player2.receive(Card(shape: .heart, rank: .two))
        
        XCTAssertTrue(player2 > player1)
    }
    
    func testTwoPairs() {
        // J, 4 투페어
        player1.receive(Card(shape: .heart, rank: .four))
        player1.receive(Card(shape: .clover, rank: .four))
        player1.receive(Card(shape: .diamond, rank: .J))
        player1.receive(Card(shape: .spade, rank: .six))
        player1.receive(Card(shape: .heart, rank: .five))
        player1.receive(Card(shape: .diamond, rank: .eight))
        player1.receive(Card(shape: .clover, rank: .J))
        
        // 10, 9 투페어
        player2.receive(Card(shape: .clover, rank: .five))
        player2.receive(Card(shape: .spade, rank: .nine))
        player2.receive(Card(shape: .diamond, rank: .nine))
        player2.receive(Card(shape: .clover, rank: .ten))
        player2.receive(Card(shape: .diamond, rank: .A))
        player2.receive(Card(shape: .heart, rank: .ten))
        player2.receive(Card(shape: .heart, rank: .two))
        XCTAssertTrue(player1 > player2)
    }
    
    func testSameTwoPairs() {
        // J, 4 투페어
        player1.receive(Card(shape: .heart, rank: .four))
        player1.receive(Card(shape: .clover, rank: .four))
        player1.receive(Card(shape: .diamond, rank: .J))
        player1.receive(Card(shape: .spade, rank: .six))
        player1.receive(Card(shape: .heart, rank: .five))
        player1.receive(Card(shape: .diamond, rank: .eight))
        player1.receive(Card(shape: .clover, rank: .J))
        
        // J, 9 투페어
        player2.receive(Card(shape: .clover, rank: .five))
        player2.receive(Card(shape: .spade, rank: .nine))
        player2.receive(Card(shape: .diamond, rank: .nine))
        player2.receive(Card(shape: .clover, rank: .J))
        player2.receive(Card(shape: .diamond, rank: .A))
        player2.receive(Card(shape: .heart, rank: .J))
        player2.receive(Card(shape: .heart, rank: .two))
        XCTAssertTrue(player2 > player1)
    }
    
    func testSameOnePair() {
        // J 원페어, 페어 다음 높은숫자 8
        player1.receive(Card(shape: .heart, rank: .four))
        player1.receive(Card(shape: .clover, rank: .A))
        player1.receive(Card(shape: .diamond, rank: .J))
        player1.receive(Card(shape: .spade, rank: .six))
        player1.receive(Card(shape: .heart, rank: .five))
        player1.receive(Card(shape: .diamond, rank: .eight))
        player1.receive(Card(shape: .clover, rank: .J))
        
        // J 원페어, 페어 다음 높은숫자 9
        player2.receive(Card(shape: .clover, rank: .five))
        player2.receive(Card(shape: .spade, rank: .A))
        player2.receive(Card(shape: .diamond, rank: .nine))
        player2.receive(Card(shape: .clover, rank: .J))
        player2.receive(Card(shape: .diamond, rank: .A))
        player2.receive(Card(shape: .heart, rank: .J))
        player2.receive(Card(shape: .heart, rank: .two))
        XCTAssertTrue(player2 > player1)
    }

}
