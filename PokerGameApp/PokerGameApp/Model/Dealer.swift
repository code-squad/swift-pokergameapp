import Foundation

class Dealer: Playable {
    let name = "딜러"
    private var cards = [Card]()
    private var cardDeck: CardDeck
    var result: Score {
        return calcurateScore(of: cards)
    }
    
    init(cardDeck: CardDeck) {
        self.cardDeck = cardDeck
    }
    
    
    public func appendCard(_ card: Card) {
        cards.append(card)
    }
    
    public func resetCard() {
        self.cards = [Card]()
    }
    
    func shareCards(cardStud: CardStud, player: Playable, _ setCardImage: (Card) -> ()) {
        let cardCount = cardStud.rawValue
        for _ in 1...cardCount {
            guard let newCard = cardDeck.removeOne() else { return }
            setCardImage(newCard)
            player.appendCard(newCard)
        }
    }
    
    
}
