import Foundation

enum CardStud: Int {
    case sevenCardStud = 7
    case fiveCardStud = 5
}

enum NumberOfParticipant: Int {
    case twoPlayer = 2
    case threePlayer = 3
    case fourPlayer = 4
    
    func iterateRawValue(eachConfig: () -> ()) {
        for _ in 1...self.rawValue {
            eachConfig()
        }
    }
}

class PokerGame {
    var players: Players
    var cardStud: CardStud
    var participant: NumberOfParticipant
    var dealer: Dealer
    
    init() {
        self.participant = .twoPlayer
        self.players = Players()
        self.dealer = Dealer()
        players.registerPlayers(numberOfPlayer: self.participant, dealer: self.dealer)
        self.cardStud = .sevenCardStud
    }
    
    init(numberOfPlayer: NumberOfParticipant, stud: CardStud) {
        self.participant = numberOfPlayer
        self.players = Players()
        self.dealer = Dealer()
        players.registerPlayers(numberOfPlayer: numberOfPlayer, dealer: self.dealer)
        self.cardStud = stud
    }
    
    func setNextGame(player: Playable, setCardImage: (Card) -> ()) {
        dealer.shareCards(cardStud: cardStud, player: player, setCardImage)
    }
}
