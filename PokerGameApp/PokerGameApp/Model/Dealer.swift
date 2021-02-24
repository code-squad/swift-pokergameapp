import Foundation

protocol Playable {
    var name: String { get }
    var result: Score { get }
    func appendCard(_ card: Card)
    func resetCard()
}

class Dealer: Playable {
    let name = "딜러"
    private var cards = [Card]()
    private var cardDeck: CardDeck
    var result: Score {
        return Dealer.calcurateScore(of: cards)
    }
    
    init(cardDeck: CardDeck) {
        self.cardDeck = cardDeck
    }
    
    
    public func appendCard(_ card: Card) {
        cards.append(card)
    }
    
    public func resetCard() {
        self.cards = [Card]()
    }
    
    func shareCards(cardStud: CardStud, player: Playable, _ setCardImage: (Card) -> ()) {
        let cardCount = cardStud.rawValue
        for _ in 1...cardCount {
            guard let newCard = cardDeck.removeOne() else { return }
            setCardImage(newCard)
            player.appendCard(newCard)
        }
    }
    
    static func calcurateScore(of cards: [Card]) -> Score {
        var eachCardScore = Dictionary<Card.Rank, Int>()
        for card in cards {
            card.countScoreOfRankValue { (rank) in
                eachCardScore[rank, default: 0] += 1
            }
        }
        
        // eachCardScore 중 가장 높은 score를 Dictionary 형태로 가집니다
        guard let maxCardScore = eachCardScore.max(by: { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value }) else { return .none }
        // straignt 판정합니다. 아니라면 .none을 반환합니다
        let straightScore = straightLogic(maxCardScore: maxCardScore, eachCardScore: eachCardScore)
        // TwoPair 판정을 위해 같은 카드가 두개인 것을 일단 골라냅니다.
        let correctTwoPairs = eachCardScore.filter({ $0.value == 2 })
        
        switch maxCardScore.value {
        case 4:
            return .fourCard(rank: maxCardScore.key)
        case _ where straightScore != .none:
            return straightScore
        case 3:
            return .triple(rank: maxCardScore.key)
        case 2 where correctTwoPairs.count == 2:
            return twoPairLogic(correctTwoPairs: correctTwoPairs)
        case 2:
            return .onePair(rank: maxCardScore.key)
        default:
            return .none
        }
    }
}

extension Dealer {
    static public func twoPairLogic(correctTwoPairs: [Card.Rank : Int]) -> Score{
        if let twoPair = correctTwoPairs.max(by: { $0.value < $1.value }) {
            return .twoPair(rank: twoPair.key)
        } else {
            return .none
        }
    }
    
    static public func straightLogic(maxCardScore: Dictionary<Card.Rank, Int>.Element, eachCardScore: [Card.Rank: Int]) -> Score {
        var isStraight = false
        var beforeNum = -1
        var currectCount = 1
        
        var high: Card.Rank = .ace
        for rank in eachCardScore.keys.sorted() {
            if beforeNum + 1 == rank.rawValue || (beforeNum == 13 && rank.rawValue == 1) {
                currectCount += 1
                if currectCount == 5 {
                    high = rank
                    isStraight = true
                    break
                }
            } else {
                currectCount = 1
            }
            beforeNum = rank.rawValue
        }
        
        let straightHighRank = high.rawValue >= 6 && high.rawValue <= 13 ? high : .ace
        if isStraight {
            return .straight(rank: straightHighRank)
        } else {
            return .none
        }
    }
}
