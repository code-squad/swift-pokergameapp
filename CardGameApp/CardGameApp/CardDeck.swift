import Foundation

struct CardDeck: Equatable {
    private var cards: [Card]!
    var count: Int {
        return cards.count
    }
    
    init() {
        cards = [Card]()
        createCardDeck()
    }
    
    mutating func createCardDeck() {
        for rank in Card.Rank.allCases {
            for suit in Card.Suit.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
        shuffle()
    }
    
    mutating func reset() {
        cards.removeAll()
        createCardDeck()
    }
    
    mutating func shuffle() {
        for i in 0..<cards.count - 1 {
            let randomIndex = Int.random(in: i..<cards.count)
            let temp = cards[i]
            cards[i] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
    
    mutating func removeOne() -> Card? {
        guard cards.count > 0 else { return nil }
        let pickedCardIndex = Int.random(in: 0..<cards.count)
        let removedCard = cards.remove(at: pickedCardIndex)
        return removedCard
    }
}
