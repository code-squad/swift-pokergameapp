class Dealer: Playable {
    private var cards = [Card]()
    private var deck: Deck
    
    init(deck: Deck) {
        self.deck = deck
    }

    /// 게임을 시작한다. 자신을 포함해 모든 플레이어에게 카드를 돌린다.
    func startGame(rule: Game.Rule, players: [Playable]) {
        self.prepare()
        
        let numberOfCards = rule.rawValue
        (1...numberOfCards).forEach { _ in
            dealCardsOfOneRound(players)
        }
    }
    
    func receive(card: Card) {
        self.cards.append(card)
    }

    /// 게임 준비. 카드를 섞는다
    private func prepare() {
        self.deck.reset()
        self.deck.shuffle()
    }
    
    // 카드를 한 장 뽑아 플레이어들에게 돌린다.
    private func dealCardsOfOneRound(_ players: [Playable]) {
        (players + [self]).forEach { player in
            if let card = deck.removeOne() {
                player.receive(card: card)
            }
        }
    }
    
    func isReadyToGame(requiredCards: Int) -> Bool {
        return self.cards.count == requiredCards
    }
}

class Player: Playable {
    private var cards = [Card]()
    
    func receive(card: Card) {
        self.cards.append(card)
    }
    
    func isReadyToGame(requiredCards: Int) -> Bool {
        return self.cards.count == requiredCards
    }
}

protocol Playable {
    func receive(card: Card)
    func isReadyToGame(requiredCards: Int) -> Bool
}
