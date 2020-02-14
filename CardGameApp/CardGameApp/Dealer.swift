import Foundation

class Dealer: Player {
    var role = "딜러"
    var cards = [Card]()
    private var cardDeck = CardDeck()
    
    func recieveCard(newCard: Card) {
        cards.append(newCard)
    }
}
