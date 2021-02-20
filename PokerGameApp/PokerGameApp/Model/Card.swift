import Foundation

struct Card: CustomStringConvertible {
    enum Shape: String, CaseIterable, CustomStringConvertible {
        case clubs = "♣️"
        case diamone = "♦️"
        case hearts = "❤️"
        case spades = "♠️"
        
        var imageName: String {
            switch self {
            case .clubs: return "c"
            case .diamone: return "d"
            case .hearts: return "h"
            case .spades: return "s"
            }
        }
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    enum Rank: Int, CaseIterable, CustomStringConvertible {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
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
    
    var imageName: String {
        return "\(shape.imageName)\(rank)"
    }
    
    var description: String {
        return "\(shape)\(rank)"
    }
}

