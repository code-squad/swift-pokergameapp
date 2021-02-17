import Foundation

class Card: PokerGame, CustomStringConvertible {
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
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .jack: return "J"
            
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
    
    var description: String {
        return "\(shape)\(rank)"
    }
}
