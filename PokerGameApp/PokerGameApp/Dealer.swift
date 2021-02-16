import Foundation

protocol Playable {
    var name: String { get }
    var cards: [Card] { get }
    func getCard(_ card: Card)
}

class Dealer: Playable {
    enum CardStud: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
    }
    
    var name = "딜러"
    var cards = [Card]()
    private var cardDeck = CardDeck()
    
    public func start(numberOfPlayer: UInt, stud: CardStud) {
        guard numberOfPlayer >= 1 || numberOfPlayer <= 4 else { return }
        
        let players = registerPlayer(of: numberOfPlayer)
        
        let turns = stud.rawValue
        shareCards(players: players, count: turns)
        
        printHand(of: players)
    }
    
    private func registerPlayer(of number: UInt) -> [Playable] {
        var players = [Playable]()
        
        for _ in 1...number {
            let player = Player()
            players.append(player)
        }
        
        let dealer = self
        players.append(dealer)
        
        return players
    }
    
    private func shareCards(players: [Playable], count: Int) {
        for _ in 1...count {
            players.forEach { (player) in
                guard let newCard = cardDeck.removeOne() else { return }
                player.getCard(newCard)
            }
        }
    }
    
    private func printHand(of players: [Playable]) {
        players.forEach { (player) in
            print("\(player.name)", player.cards)
        }
    }
    
    func getCard(_ card: Card) {
        cards.append(card)
    }

}
