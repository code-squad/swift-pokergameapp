protocol Playable {
    func receive(card: Card)
    func isReadyToGame(requiredCards: Int) -> Bool
}

class Player: Playable {
    private var cards = [Card]()
    
    func receive(card: Card) {
        self.cards.append(card)
    }
    
    func isReadyToGame(requiredCards: Int) -> Bool {
        return self.cards.count == requiredCards
    }
    
    static func create(count: Int) throws -> [Player] {
        guard count >= 1 else {
            throw GameError.playersOutOfRange
        }
        return (1...count).map { _ in Player() }
    }
}
