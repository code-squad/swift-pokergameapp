import XCTest

class DeckTests: XCTestCase {
    let numberOfRank = Card.Rank.allCases.count
    let numberOfSuit = Card.Suit.allCases.count
    let numberOfAllCards = Card.Rank.allCases.count * Card.Suit.allCases.count

    func testCreateDeck() {
        let deck = CardGameFactory.createDeck()
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
        let deck = CardGameFactory.createDeck()
        XCTAssertEqual(deck.count, numberOfAllCards)
    }
    
    func testRemoveOne() {
        var deck = CardGameFactory.createDeck()
        deck.removeOne()
        XCTAssertEqual(deck.count, numberOfAllCards - 1)
        deck.removeOne()
        XCTAssertEqual(deck.count, numberOfAllCards - 2)
        
    }
    
    func testRemoveAllCards() {
        var deck = CardGameFactory.createDeck()
        (1...numberOfAllCards).forEach { _ in deck.removeOne() }
        
        let card = deck.removeOne()
        
        XCTAssertNil(card)
    }
    
    func testReset() {
        var deck = CardGameFactory.createDeck()
        deck.removeOne()
        deck.reset()
        XCTAssertEqual(deck.count, numberOfAllCards)
    }
}
