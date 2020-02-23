import Foundation

class Participant {
    private var cards = [Card]()
    
    func recieveCard(newCard: Card) {
        cards.append(newCard)
    }
    
    func statusOfOwnCards() -> [Card] {
        return self.cards
    }
}
