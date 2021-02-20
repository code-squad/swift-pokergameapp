import Foundation

enum CardStud: Int {
    case sevenCardStud = 7
    case fiveCardStud = 5
}

enum NumberOfParticipant: Int {
    case twoPlayer = 2
    case threePlayer = 3
    case fourPlayer = 4
}

class PokerGame {
    var players: Players
    var cardStud: CardStud
    var participant: NumberOfParticipant
    var cardDeck: CardDeck
    
    init(numberOfPlayer: NumberOfParticipant, stud: CardStud) {
        self.participant = numberOfPlayer
        self.cardDeck = CardDeck()
        self.players = Players()
        players.registerPlayers(numberOfPlayer: numberOfPlayer)
        self.cardStud = stud
    }
    
    func shareCards(cardStud: CardStud, player: Playable, _ setCardImage: (Card) -> ()) {
        let cardCount = cardStud.rawValue
        for _ in 1...cardCount {
            guard let newCard = cardDeck.removeOne() else { return }
            setCardImage(newCard)
            player.appendCard(newCard)
        }
    }
}
