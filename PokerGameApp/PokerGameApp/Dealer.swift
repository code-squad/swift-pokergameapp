import Foundation

protocol Playable {
    var name: String { get }
    // 해당 프로퍼티는 이후 step에서 player간 score 비교를 위해 finalScore라는 이름을 가진 속성으로 다른 return값이 반환될 것 같습니다.
    // 이번 step에서는 출력 테스트용으로 작성됐습니다.
    var result: [Card] { get }
    func appendCard(_ card: Card)
}

class Dealer: PokerGame, Playable {
    let name = "딜러"
    private var cards = [Card]()
    var result: [Card] {
        return cards
    }
    
    private var cardDeck = CardDeck()
    
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
