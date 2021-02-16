import Foundation

protocol cardCreatable {
    static func createCardSet() -> [Card]
}

class Dealer: cardCreatable {
    public static func createCardSet() -> [Card] {
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
