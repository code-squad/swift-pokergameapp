import Foundation

protocol Playable {
    var name: String { get }
    func appendCard(_ card: Card)
    func resetCard()
}

class Dealer: Playable {
    let name = "딜러"
    private var cards = [Card]()
    private var cardDeck: CardDeck
    private var result: Score {
        return Dealer.calcurateCardScore(cards: cards)
    }
    
    init() {
        self.cardDeck = CardDeck()
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
    
    static func calcurateCardScore(cards: [Card]) -> Score {
        var eachCardCount = Dictionary<Card.Rank, Int>()
        for card in cards {
            card.calcurareScore { (shape, rank) in
                eachCardCount[rank, default: 0] += 1
            }
        }
        guard let maxCardCount = eachCardCount.max(by: { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value }) else { return .none }
        
        
        let straightScore = straightLogic(maxCardCount: maxCardCount, eachCardCount: eachCardCount)
        let correctTwoRank = eachCardCount.filter({ $0.value == 2 })
        switch maxCardCount.value {
        case 4:
            return .fourCard(maxCardCount.key)
        case _ where straightScore != .none:
            return straightScore
        case 3:
            return .triple(maxCardCount.key)
        case 2 where correctTwoRank.count == 2:
            if let twoPair = correctTwoRank.max(by: { $0.value < $1.value }) {
                return .twoPair(twoPair.key)
            } else {
                return .none
            }
        case 2:
            return .onePair(maxCardCount.key)
        default:
            return .none
        }
    }
}

extension Dealer {
    static public func straightLogic(maxCardCount: Dictionary<Card.Rank, Int>.Element, eachCardCount: [Card.Rank: Int]) -> Score {
        var isStraight = false
        var beforeNum = -1
        var currectCount = 1
        var high: Card.Rank = .ace
        for rank in eachCardCount.keys.sorted() {
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
            return .straight(straightHighRank)
        } else {
            return .none
        }
    }
}
