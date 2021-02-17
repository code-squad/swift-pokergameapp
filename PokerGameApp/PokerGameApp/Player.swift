import Foundation

class Player: PokerGame, Playable {
    var name: String
    private var cards = [Card]()
    var result: [Card] {
        return cards
    }
    
    private static var identifierFactory = 0
    
    override init() {
        Player.identifierFactory += 1
        self.name = "참가자\(Player.identifierFactory)#"
    }
    
    public func appendCard(_ card: Card) {
        cards.append(card)
    }
}
