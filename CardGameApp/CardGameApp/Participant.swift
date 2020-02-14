import Foundation

class Participant: Player {
    var role = "참가자"
    var cards = [Card]()
    
    func recieveCard(newCard: Card) {
        cards.append(newCard)
    }
}
