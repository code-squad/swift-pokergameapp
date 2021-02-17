import Foundation

class PokerGame {
    var players = [Playable]()
    
    enum CardStud: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
    }
    
    enum Participant: Int {
        case onePlayer = 1
        case twoPlayer = 2
        case threePlayer = 3
        case fourPlayer = 4
    }
    
    struct CardBox {
        static func takeSetOfCards() -> [Card] {
            var cards = [Card]()
            
            for rank in Card.Rank.allCases {
                for shape in Card.Shape.allCases {
                    let card = Card(with: shape.self, rank: rank.self)
                    cards.append(card)
                }
            }
            return cards
        }
    }
}
