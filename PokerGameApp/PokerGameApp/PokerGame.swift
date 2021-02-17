import Foundation

class PokerGame {
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
    
    var players = [Playable]()
    var cardDeck = CardDeck()
    let dealer = Dealer()
    
    public func start(numberOfPlayer: Participant, stud: CardStud) {
        players = registerPlayer(of: numberOfPlayer)
        shareCards(players: players, cardStud: stud)
    }
    
    private func shareCards(players: [Playable], cardStud: CardStud) {
        let cardCount = cardStud.rawValue
        for _ in 1...cardCount {
            players.forEach { (player) in
                guard let newCard = cardDeck.removeOne() else { return }
                player.appendCard(newCard)
            }
        }
    }
    
    private func registerPlayer(of number: Participant) -> [Playable] {
        var players = [Playable]()
        
        let playerCount = number.rawValue
        for _ in 1...playerCount {
            let player = Player()
            
            players.append(player)
        }
        players.append(dealer)
        
        return players
    }
    
}
