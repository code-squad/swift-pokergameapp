import Foundation

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

class PokerGame {
    var players: Players
    var cardStud: CardStud
    var cardDeck: CardDeck
    var dealer: Dealer
    
    init(numberOfPlayer: Participant, stud: CardStud) {
        self.dealer = Dealer()
        self.cardDeck = CardDeck()
        self.players = Players(numberOfPlayer: .fourPlayer)
        self.cardStud = stud
    }
    
    public func start() {
        players.sharedCards(cardStud: cardStud)
    }
}
