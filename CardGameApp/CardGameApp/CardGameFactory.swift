struct CardGameFactory {
    static func createDealer(deck: Deck = createDeck()) -> Dealer {
        return Dealer(deck: deck)
    }
    
    static func createDeck(cards: [Card] = createAllCards()) -> Deck {
        return Deck(cards: cards)
    }
    
    static func createAllCards() -> [Card] {
        return Card.Suit.allCases.flatMap {
            createCards(per: $0)
        }
    }
    
    static func createPlayers(count: Int) throws -> [Player] {
        guard count >= 1 else {
            throw GameError.playersOutOfRange
        }
        return (1...count).map { _ in Player() }
    }
    
    private static func createCards(per suit: Card.Suit) -> [Card] {
        return Card.Rank.allCases.map {
            Card(suit: suit, rank: $0)
        }
    }
}
