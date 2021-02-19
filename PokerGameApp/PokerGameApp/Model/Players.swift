import Foundation

class Players {
    private var players: [Playable]
    private var cardDeck: CardDeck
    var list: [Playable] {
        return players
    }
    
    init(numberOfPlayer: Participant) {
        players = [Playable]()
        cardDeck = CardDeck()
        
        for _ in 1...numberOfPlayer.rawValue {
            let player = Player()
            players.append(player)
        }
        let dealer = Dealer()
        players.append(dealer)
    }
    
    func sharedCards(cardStud: CardStud) {
        let cardCount = cardStud.rawValue
        for _ in 1...cardCount {
            players.forEach { (player) in
                guard let newCard = cardDeck.removeOne() else { return }
                player.appendCard(newCard)
            }
        }
    }
}
