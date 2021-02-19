import Foundation

protocol Playable {
    var name: String { get }
    var result: [Card] { get }
    func appendCard(_ card: Card)
    func resetCard()
}

class Dealer: Playable {
    let name = "딜러"
    private var cards = [Card]()
    var result: [Card] {
        return cards
    }
    
    func appendCard(_ card: Card) {
        cards.append(card)
    }
    
    func resetCard() {
        self.cards = [Card]()
    }
}
