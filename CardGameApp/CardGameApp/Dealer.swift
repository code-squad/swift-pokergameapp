class Dealer: Playable {
    private var cards = [Card]()
    private var deck: Deck
    
    init(deck: Deck) {
        self.deck = deck
    }

    /// 게임 준비. 카드를 섞는다
    func prepareDeck() {
        self.deck.reset()
        self.deck.shuffle()
    }
    
    func receive(card: Card) {
        self.cards.append(card)
    }

    // 카드를 한 장 뽑아 플레이어들에게 돌린다.
    func dealCardsOfOneRound(_ players: [Playable]) {
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
