import Foundation

class Dealer {
    enum CardStud: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
    }
    
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
        let dealer = Player(name: "딜러")
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

}
