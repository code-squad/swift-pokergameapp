import Foundation

protocol Playable {
    var name: String { get }
    var playResult: [Card] { get }
    func getCard(_ card: Card)
}

class Dealer: Playable {
    enum CardStud: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
    }
    
    enum Participant: Int {
        case onePlayer = 1
        case twoPlayer = 2
        case threePlayer = 3
        case fourPlayer = 4
    }
    
    let name = "딜러"
    private var cards = [Card]()
    private var cardDeck = CardDeck()
    var playResult: [Card] {
        return cards
    }
    
    public func start(numberOfPlayer: Participant, stud: CardStud) {
        let players = registerPlayer(of: numberOfPlayer)
        
        shareCards(players: players, cardStud: stud)
        
        printHand(of: players)
    }
    
    private func registerPlayer(of number: Participant) -> [Playable] {
        var players = [Playable]()
        
        let playerCount = number.rawValue
        for _ in 1...playerCount {
            let player = Player()
            
            players.append(player)
        }
        
        let dealer = self
        players.append(dealer)
        
        return players
    }
    
    private func shareCards(players: [Playable], cardStud: CardStud) {
        let cardCount = cardStud.rawValue
        for _ in 1...cardCount {
            players.forEach { (player) in
                guard let newCard = cardDeck.removeOne() else { return }
                player.getCard(newCard)
            }
        }
    }
    
    private func printHand(of players: [Playable]) {
        players.forEach { (player) in
            print("\(player.name)", player.playResult)
        }
    }
    
    func getCard(_ card: Card) {
        cards.append(card)
    }
    
}
