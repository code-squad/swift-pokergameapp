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
    
    public func calculateScore() -> [Playable] {
        // 추후 미션에서 Dealer 역할을 할 score 계산 산출이 이 메소드에서 이뤄집니다.
        return players
    }
    
    func appendCard(_ card: Card) {
        cards.append(card)
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
        players.append(self)
        
        return players
    }
}
