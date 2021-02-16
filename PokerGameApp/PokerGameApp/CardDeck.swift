import Foundation

struct CardDeck {
    private var cards = [Card]()
    
    init() {
        cards = Dealer.createCardSet()
    }
    
    public var count: Int {
        return cards.count
    }
    
    public mutating func shuffle() {
        cards.customShuffled()
    }
    
    public mutating func removeOne() -> Card? {
        guard let card = cards.popLast() else { return nil }
        return card
    }
    
    public mutating func reset() {
        cards = Dealer.createCardSet()
    }
}

extension Array {
    mutating func customShuffled() {
        for index in 0..<self.count {
            let randomIndex = Int.random(in: index..<self.count)
            
            let temp = self[index]
            self[index] = self[randomIndex]
            self[randomIndex] = temp
        }
    }
}
