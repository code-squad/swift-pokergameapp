import Foundation

enum CardStud: Int, CaseIterable {
    case sevenCardStud = 7
    case fiveCardStud = 5
}

enum NumberOfParticipant: Int, CaseIterable {
    case twoPlayer = 2
    case threePlayer = 3
    case fourPlayer = 4
}

class PokerGame {
    var players: Players
    var cardStud: CardStud
    var participant: NumberOfParticipant
    var dealer: Dealer
    var cardDeck: CardDeck
    
    init() {
        self.participant = .twoPlayer
        self.players = Players()
        self.cardDeck = CardDeck()
        self.dealer = Dealer(cardDeck: cardDeck)
        players.registerPlayers(numberOfPlayer: self.participant, dealer: self.dealer)
        self.cardStud = .sevenCardStud
    }
    
    init(numberOfPlayer: NumberOfParticipant, stud: CardStud) {
        self.participant = numberOfPlayer
        self.players = Players()
        self.cardDeck = CardDeck()
        self.dealer = Dealer(cardDeck: cardDeck)
        players.registerPlayers(numberOfPlayer: numberOfPlayer, dealer: self.dealer)
        self.cardStud = stud
    }
    
    func setNextGame(player: Playable, setCardImage: (Card) -> ()) {
        dealer.shareCards(cardStud: cardStud, player: player, setCardImage)
    }
}
