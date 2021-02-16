import Foundation

protocol CardCreatable {
    static func createCardSet() -> [Card]
}

extension CardCreatable {
    static func createCardSet() -> [Card] {
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

class Card: CardCreatable {
    enum Shape: String {
        case clubs = "♣️"
        case diamone = "♦️"
        case hearts = "❤️"
        case spades = "♠️"
    }
    
    enum Rank: Int {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
        var rankName: String {
            switch self {
            case .ace: return "A"
            case .jack: return "J"
            case .queen: return "Q"
            case .king: return "K"
            default: return "\(self.rawValue)"
            }
        }
    }
    
    var shape: Shape
    var rank: Rank
    
    init(with shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(shape)\(rank)"
    }
}

extension Card.Rank: CustomStringConvertible, CaseIterable {
    var description: String {
        return rankName
    }
}

extension Card.Shape: CustomStringConvertible, CaseIterable {
    var description: String {
        return "\(self.rawValue)"
    }
}
