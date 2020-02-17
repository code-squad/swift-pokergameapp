import XCTest

class DeckTests: XCTestCase {
    let numberOfRank = Card.Rank.allCases.count
    let numberOfSuit = Card.Suit.allCases.count
    let numberOfAllCards = Card.Rank.allCases.count * Card.Suit.allCases.count

    func testCreateDeck() {
        let cards = Card.createAll()
        let deck = Deck(cards: cards)
        XCTAssertEqual(deck.count, numberOfRank * numberOfSuit)
    }
    
    func testCreateDeckSimply() {
        let deck = Deck()
        XCTAssertEqual(deck.count, numberOfRank * numberOfSuit)
    }
    
    func testRemoveOne() {
        var deck = Deck()
        deck.removeOne()
        XCTAssertEqual(deck.count, numberOfAllCards - 1)
        deck.removeOne()
        XCTAssertEqual(deck.count, numberOfAllCards - 2)
        
    }
    
    func testRemoveAllCards() {
        var deck = Deck()
        (1...numberOfAllCards).forEach { _ in deck.removeOne() }
        
        let card = deck.removeOne()
        
        XCTAssertNil(card)
    }
    
    func testReset() {
        var deck = Deck()
        deck.removeOne()
        deck.reset()
        XCTAssertEqual(deck.count, numberOfAllCards)
    }
}
