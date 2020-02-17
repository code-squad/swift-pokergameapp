import XCTest

class CardTests: XCTestCase {
    let numberOfRank = Card.Rank.allCases.count
    let numberOfSuit = Card.Suit.allCases.count
    let numberOfAllCards = Card.Rank.allCases.count * Card.Suit.allCases.count
    
    func testNewCard() {
        let card = Card(suit: .heart, rank: .king)
        XCTAssertEqual(card.description, "♥️K")
        
        let card2 = Card(suit: .spade, rank: .ten)
        XCTAssertEqual(card2.description, "♠️10")
    }
    
    func testCreateAllCards() {
        let cards = Card.createAll()
        let numberPerSuit = Card.Suit.allCases.map { suit in
            cards.filter {
                $0.suit == suit
            }.count
        }
        
        let expected = [Int](repeating: numberOfRank, count: numberOfSuit)
        XCTAssertEqual(numberPerSuit, expected)
    }
    
}
