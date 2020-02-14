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
}
