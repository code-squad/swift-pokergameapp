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

class Card: CardCreatable, CustomStringConvertible {
    enum Shape: String, CaseIterable, CustomStringConvertible {
        case clubs = "♣️"
        case diamone = "♦️"
        case hearts = "❤️"
        case spades = "♠️"
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    enum Rank: Int, CaseIterable, CustomStringConvertible {
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
        
        var description: String {
            return rankName
        }
    }
    
    var shape: Shape
    var rank: Rank
    
    init(with shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    var description: String {
        return "\(shape)\(rank)"
    }
}
