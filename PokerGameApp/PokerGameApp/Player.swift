import Foundation

protocol Playable {
    var name: String { get }
    var cards: [Card] { get }
    func getCard(_ card: Card)
}

class Player: Playable {
    var name: String
    var cards = [Card]()
    
    private static var identifierFactory = 0
    
    init() {
        Player.identifierFactory += 1
        self.name = "참가자\(Player.identifierFactory)#"
    }
    
    init(name: String) {
        self.name = name
    }
    
    public func getCard(_ card: Card) {
        cards.append(card)
    }
}
