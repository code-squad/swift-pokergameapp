import Foundation

struct Card: CustomStringConvertible {
    enum Shape: String, CaseIterable, CustomStringConvertible {
        case clubs = "♣️"
        case diamone = "♦️"
        case hearts = "❤️"
        case spades = "♠️"
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    enum Rank: Int, CaseIterable, CustomStringConvertible, Comparable {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
        static func < (lhs: Card.Rank, rhs: Card.Rank) -> Bool {
            if lhs == .ace {
                return lhs > rhs
            } else if rhs == .ace {
                return lhs < rhs
            } else {
                return lhs.rawValue < rhs.rawValue
            }
        }
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .king: return "K"
            case .queen: return "Q"
            case .jack: return "J"
            default: return "\(self.rawValue)"
            }
        }
    }
    
    private var shape: Shape
    private var rank: Rank
    
    init(with shape: Shape, rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
    
    func calcurareScore(block: (Card.Shape, Card.Rank) -> ()) {
        let rank = self.rank
        let shape = self.shape
        block(shape, rank)
    }
    
    var description: String {
        return "\(shape)\(rank)"
    }
}

