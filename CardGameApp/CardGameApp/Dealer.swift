class Dealer: Playable {
    var cards = [Card]()
    private var deck: Deck
    
    init(deck: Deck) {
        self.deck = deck
    }

    /// playerㅇ에게 한 장의 카드를 건넴
    func give(card: Card, to player: Playable) {
        var player = player
        player.receive(card: card)
    }

    /// 게임을 시작한다. 자신을 포함해 모든 플레이어에게 카드를 돌린다.
    func startGame(rule: Game.Rule, players: [Playable]) {
        self.prepare()
        
        let numberOfCards = rule.rawValue
        (1...numberOfCards).forEach { _ in
            dealCardsOfOneRound(players)
        }
    }
    
    /// 게임 준비. 카드를 섞는다
    private func prepare() {
        self.deck.reset()
        self.deck.shuffle()
    }
    
    private func dealCardsOfOneRound(_ players: [Playable]) {
        (players + [self]).forEach { player in
            if let card = deck.removeOne() {
                self.give(card: card, to: player)
            }
        }
    }
}

class Player: Playable {
    var cards = [Card]()
}

protocol Playable {
    var cards: [Card] { get set }
}

extension Playable {
    mutating func receive(card: Card) {
        self.cards.append(card)
    }
}
