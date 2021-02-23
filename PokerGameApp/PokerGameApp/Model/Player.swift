import Foundation

class Player: Playable {
    let name: String
    private var cards = [Card]()
    var result: Score {
        return Dealer.calcurateCardScore(cards: cards)
    }
    
    init(ID: Int) {
        self.name = "참가자\(ID)#"
    }
    
    public func appendCard(_ card: Card) {
        cards.append(card)
    }
    
    public func resetCard() {
        self.cards = [Card]()
    }
}
