import XCTest
@testable import CardGameApp

class DeckTests: XCTestCase {
    var deck: Deck!
    let numberOfRank = Card.Rank.allCases.count
    let numberOfSuit = Card.Suit.allCases.count
    let numberOfAllCards = Card.Rank.allCases.count * Card.Suit.allCases.count

    override func setUp() {
        self.deck = CardGameFactory.createDeck()
    }
    
    func testCreateDeck() {
        XCTAssertEqual(deck.count, numberOfRank * numberOfSuit)
    }
    
    func testCreateAllCards() {
        let cards = CardGameFactory.createAllCards()
        let numberPerSuit = Card.Suit.allCases.map { suit in
            cards.filter {
                $0.suit == suit
            }.count
        }
        
        let expected = [Int](repeating: numberOfRank, count: numberOfSuit)
        XCTAssertEqual(numberPerSuit, expected)
    }
    
    func testCount() {
        XCTAssertEqual(deck.count, numberOfAllCards)
    }
    
    func testRemoveOne() {
        deck.removeOne()
        XCTAssertEqual(deck.count, numberOfAllCards - 1)
        deck.removeOne()
        XCTAssertEqual(deck.count, numberOfAllCards - 2)
        
    }
    
    func testRemoveAllCards() {
        (1...numberOfAllCards).forEach { _ in deck.removeOne() }
        
        let card = deck.removeOne()
        
        XCTAssertNil(card)
    }
    
    func testReset() {
        deck.removeOne()
        deck.reset()
        XCTAssertEqual(deck.count, numberOfAllCards)
    }
}
