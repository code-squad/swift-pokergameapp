import Foundation

class PokerGame {
    private var dealer: Dealer
    private var players: [Player]
    private var stud: CardStud
    private var participants: Participants
    
    init(stud: CardStud, participants: Participants) {
        self.dealer = Dealer()
        self.players = [Player]()
        self.stud = .seven
        self.participants = .four
    }
    
    enum CardStud:Int {
        case seven = 7
        case five = 5
    }
    
    enum Participants: Int {
        case one = 1, two, three, four
    }
    
    private func startGame() {
        for _ in 0..<stud.rawValue {
            for player in players {
                dealCardToPlayer(player: player)
            }
            dealCardToPlayer(player: dealer)
        }
    }
    
    private func dealCardToPlayer(player: Player) {
        let dealCard = dealer.deal()
        if let card = dealCard {
            player.recieveCard(card: card)
        } else {
            print("모든 카드를 소진하였습니다.")
        }
    }
}

extension PokerGame:CustomStringConvertible {
    var description: String {
        var deck = ""
        var count = 1
        for player in players {
            deck += "참가자 #\(count)\(player)\n"
            count+=1
        }
        deck += "딜러 \(dealer)"
        return deck
    }
}
