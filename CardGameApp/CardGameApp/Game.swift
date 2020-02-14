// 플레이어는 1~4명
struct Game {
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
    
    /// 게임을 시작한다. 자신을 포함해 모든 플레이어에게 카드를 돌린다.
    func start() {
        dealer.prepareDeck()
        
        (1...rule.requiredCards).forEach { _ in
            dealer.dealCardsOfOneRound(players)
        }
    }
}

enum GameError: Error {
    case playersOutOfRange
}

enum Rule {
    case fiveStud
    case sevenStud
    
    var requiredCards: Int {
        switch self {
        case .fiveStud:
            return 5
        case .sevenStud:
            return 7
        }
    }
}

