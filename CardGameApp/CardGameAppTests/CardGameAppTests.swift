//
//  CardGameAppTests.swift
//  CardGameAppTests
//
//  Created by Keunna Lee on 2020/02/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import XCTest
@testable import CardGameApp

class CardGameAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAddCard() {
        // Given
        let viewController = ViewController()
        let cardStack = viewController.cardsStack
        // When
        let description = viewController.addCards()
        let subViewCount = cardStack.subviews.count
        // Then
        XCTAssertEqual(subViewCount, 7)
    }
    
    func testDescripteCard() {
        // Given
        let card = Card(suit: .hearts , rank: .eight )
        // When
        let description = card.descripteCard()
        // Then
        XCTAssertEqual(description, "♥️8")
    }

}
