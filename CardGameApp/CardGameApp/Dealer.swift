import Foundation

class Dealer: Participant {
    private var cardDeck = CardDeck()
    var remainingCardsCount: Int {
        return cardDeck.count
    }
    
    func pickOneCard() -> Card? {
        cardDeck.removeOne()
    }
}
