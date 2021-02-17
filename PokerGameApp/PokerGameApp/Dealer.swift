import Foundation

protocol Playable {
    var name: String { get }
    // 해당 프로퍼티는 이후 step에서 player간 score 비교를 위해 써보려 했습니다. step 이후에 반환 값이 바뀔 수 있습니다.
    var finalScore: [Card] { get }
    func appendCard(_ card: Card)
}

class Dealer: PokerGame, Playable {
    let name = "딜러"
    private var cards = [Card]()
    private var cardDeck = CardDeck()
    var finalScore: [Card] {
        return cards
    }
    
    public func start(numberOfPlayer: Participant, stud: CardStud) {
        players = registerPlayer(of: numberOfPlayer)
        shareCards(players: players, cardStud: stud)
    }
    
    private func registerPlayer(of number: Participant) -> [Playable] {
        var players = [Playable]()
        
        let playerCount = number.rawValue
        for _ in 1...playerCount {
            let player = Player()
            
            players.append(player)
        }
        let dealer = self
        players.append(dealer)
        
        return players
    }
    
    private func shareCards(players: [Playable], cardStud: CardStud) {
        let cardCount = cardStud.rawValue
        for _ in 1...cardCount {
            players.forEach { (player) in
                guard let newCard = cardDeck.removeOne() else { return }
                player.appendCard(newCard)
            }
        }
    }
    
    func appendCard(_ card: Card) {
        cards.append(card)
    }
}
