// 플레이어는 1~4명
struct Game {
    enum Rule: Int {
        case fiveStud = 5
        case sevenStud = 7
    }

    private let playerRange = 1...4
    private let rule: Rule
    private let dealer: Dealer
    private let players: [Playable]
    
    init(rule: Rule, dealer: Dealer, players: [Playable]) throws {
        guard playerRange.contains(players.count) else {
            throw GameError.playersOutOfRange
        }
        
        self.rule = rule
        self.dealer = dealer
        self.players = players
    }
    
    func start() {
        dealer.startGame(rule: rule, players: players)
    }
}

enum GameError: Error {
    case playersOutOfRange
}
