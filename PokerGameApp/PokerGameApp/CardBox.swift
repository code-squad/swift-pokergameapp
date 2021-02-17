import Foundation

class CardBox {
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
