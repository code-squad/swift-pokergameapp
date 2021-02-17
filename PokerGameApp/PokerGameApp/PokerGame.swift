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
    
    func shareCards(players: [Playable], cardStud: CardStud) {
        let cardCount = cardStud.rawValue
        for _ in 1...cardCount {
            players.forEach { (player) in
                guard let newCard = cardDeck.removeOne() else { return }
                player.appendCard(newCard)
            }
        }
    }
}
