import Foundation

class Dealer: Player {
    var role = "딜러"
    var cards = [Card]()
    
    func recieveCard(newCard: Card) {
        cards.append(newCard)
    }
}
