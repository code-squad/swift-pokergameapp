import Foundation

protocol Playable {
    var name: String { get }
    func appendCard(_ card: Card)
    func resetCard()
}

class Dealer: Playable {
    let name = "딜러"
    private var cards = [Card]()
    
    public func appendCard(_ card: Card) {
        cards.append(card)
    }
    
    public func resetCard() {
        self.cards = [Card]()
    }
}
