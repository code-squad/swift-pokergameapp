import Foundation

struct CardDeck {
    private var cards = [Card]()
    
    init() {
        cards = Card.allCards()
    }
    
    public var count: Int {
        return cards.count
    }
    
    public mutating func shuffle() {
        cards.shuffle()
    }
    
    public mutating func removeOne() -> Card? {
        guard let card = cards.popLast() else { return nil }
        return card
    }
    
    public mutating func reset() {
        cards = Card.allCards()
    }
}
