import Foundation

class Dealer: Player {
    var role = "딜러"
    var cards = [Card]()
    private var cardDeck = CardDeck()
    var remainingCardsCount: Int {
        return cardDeck.count
    }
    
    func recieveCard(newCard: Card) {
        cards.append(newCard)
    }
    
    func pickOneCard() -> Card? {
        cardDeck.removeOne()
    }
}
