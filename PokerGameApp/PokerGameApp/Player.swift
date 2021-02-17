import Foundation

class Player: Playable {
    var name: String
    private var cards = [Card]()
    var finalScore: [Card] {
        return cards
    }
    
    private static var identifierFactory = 0
    
    init() {
        Player.identifierFactory += 1
        self.name = "참가자\(Player.identifierFactory)#"
    }
    
    init(name: String) {
        self.name = name
    }
    
    public func appendCard(_ card: Card) {
        cards.append(card)
    }
}
