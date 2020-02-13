import XCTest

class CardTests: XCTestCase {
    func testNewCard() {
        let card = Card(suit: .heart, rank: .king)
        XCTAssertEqual(card.description, "♥️K")
        
        let card2 = Card(suit: .spade, rank: .ten)
        XCTAssertEqual(card2.description, "♠️10")
    }
    
}
