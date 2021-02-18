import Foundation

class PokerGame {
    private var dealer: Dealer
    private var players: Players
    private var stud: CardStud
    private var numberOfPlayers: NumberOfPlayer
    
    init(stud: CardStud, participants: NumberOfPlayer) {
        self.dealer = Dealer()
        self.players = Players()
        self.stud = .seven
        self.numberOfPlayers = .four
        setUpPlayers()
        startGame()
    }
    
    enum CardStud:Int {
        case seven = 7
        case five = 5
    }
    
    enum NumberOfPlayer: Int {
        case one = 1, two, three, four
    }
    
    enum RemoveError: Error {
        case outOfIndex
    }
    
    private func setUpPlayers() {
        for _ in 0..<self.numberOfPlayers.rawValue {
            players.appendGamePlayer(gamePlayer: Player())
        }
    }
    
    private func startGame() {
        for _ in 0..<stud.rawValue {
            for eachPlayer in players.players {
                try? dealCardToPlayer(to: eachPlayer)
            }
            try? dealCardToPlayer(to: dealer)
        }
    }
    
    private func dealCardToPlayer(to: Player) throws {
        let dealCard = dealer.deal()
        guard let card = dealCard else {
            throw RemoveError.outOfIndex
        }
        to.recieveCard(card: card)
    }
}

extension PokerGame:CustomStringConvertible {
    var description: String {
        var deck = ""
        var count = 1
        for player in players.players {
            deck += "참가자 #\(count)\(player)\n"
            count+=1
        }
        deck += "딜러 \(dealer)"
        return deck
    }
}
