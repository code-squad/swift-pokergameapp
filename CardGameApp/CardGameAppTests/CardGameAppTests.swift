//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by kimdo2297 on 2020/02/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {

    var sut : Deck!
    
    override func setUp() {
        super.setUp()
        sut = Deck()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDeckCount(){
        // 1. given
        sut = Deck()
        // 2. when
        let count = sut.count
        // 3. then
        XCTAssertEqual(count,
                       52,
                       "sut.count is wrong")
    }

}
