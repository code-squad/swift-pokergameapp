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
    
    /// 게임을 시작한다. 자신을 포함해 모든 플레이어에게 카드를 돌린다.
    func start() {
        dealer.prepare()
        
        let numberOfCards = rule.rawValue
        (1...numberOfCards).forEach { _ in
            dealer.dealCardsOfOneRound(players)
        }
    }
}

enum GameError: Error {
    case playersOutOfRange
}

//enum Rule {
//    case fiveStud
//    case sevenStud
//
//    struct SevenStudRule {
//        let requiredCard = 7
//    }
//
//    struct FiveStudRule {
//        let requiredCard = 5
//    }
//}
//
