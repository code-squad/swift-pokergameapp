import Foundation

class CardDeck: PokerGame {
    private var cardDeck = [Card]()
    
    override init() {
        cardDeck = CardBox.takeSetOfCards()
        cardDeck = cardDeck.customShuffled()
    }
    
    public var count: Int {
        return cardDeck.count
    }
    
    public func shuffle() {
        cardDeck = cardDeck.customShuffled()
    }
    
    public func removeOne() -> Card? {
        guard let card = cardDeck.popLast() else { return nil }
        return card
    }
    
    public func reset() {
        cardDeck = CardBox.takeSetOfCards()
    }
}

extension Array {
    mutating func customShuffled() -> [Element] {
        var shuffledElements = self
        for index in 0..<shuffledElements.count {
            let randomIndex = Int.random(in: index..<shuffledElements.count)
            
            let temp = shuffledElements[index]
            shuffledElements[index] = shuffledElements[randomIndex]
            shuffledElements[randomIndex] = temp
        }
        return shuffledElements
    }
}
