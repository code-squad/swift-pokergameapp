import Foundation

class Player: Playable {
    var name: String
    private var cards = [Card]()
    private static var identifierFactory = 0
    
    init() {
        Player.identifierFactory += 1
        self.name = "참가자\(Player.identifierFactory)#"
    }
    
    public func appendCard(_ card: Card) {
        cards.append(card)
    }
    
    public func resetCard() {
        self.cards = [Card]()
    }
}
