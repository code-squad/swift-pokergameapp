import XCTest
@testable import CardGameApp

class DeckTests: XCTestCase {
    var deck: Deck!
    let numberOfCards = 13 * 4
    
    override func setUp() {
        self.deck = DeckFactory.create()
    }
    
    func testCreateDeck() {
        XCTAssertEqual(deck.count, numberOfCards)
    }
    
    func testCreateAllCards() {
        let cards = DeckFactory.createAllCards()
        let numberPerSuit = Card.Suit.allCases.map { suit in
            cards.filter {
                $0.suit == suit
            }.count
        }
        
        XCTAssertEqual(numberPerSuit, [13, 13, 13, 13])
    }
    
    func testCount() {
        XCTAssertEqual(deck.count, numberOfCards)
    }
    
    func testRemoveOne() {
        deck.removeOne()
        XCTAssertEqual(deck.count, numberOfCards - 1)
        deck.removeOne()
        XCTAssertEqual(deck.count, numberOfCards - 2)
        
    }
    
    func testRemoveAllCards() {
        (1...numberOfCards).forEach { _ in deck.removeOne() }
        
        let card = deck.removeOne()
        
        XCTAssertNil(card)
    }
    
    func testReset() {
        deck.removeOne()
        deck.reset()
        XCTAssertEqual(deck.count, numberOfCards)
    }
}
