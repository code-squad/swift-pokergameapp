import Foundation


enum Score: Comparable {
    case onePair(rank: Card.Rank)
    case twoPair(rank: Card.Rank)
    case triple(rank: Card.Rank)
    case straight(rank: Card.Rank)
    case fourCard(rank: Card.Rank)
    case none
    
    var rawValue: String {
        switch self {
        case .onePair: return "onePair"
        case .twoPair: return "twoPair"
        case .triple: return "triple"
        case .straight: return "straight"
        case .fourCard: return "fourCard"
        default: return "none"
        }
    }
    
    var cardRank: Card.Rank? {
        switch self {
        case .onePair(let rank): return rank
        case .twoPair(let rank): return rank
        case .triple(let rank): return rank
        case .straight(let rank): return rank
        case .fourCard(let rank): return rank
        case .none: return nil
        }
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        if lhs.cardRank == nil {
            return true
        } else if rhs.cardRank == nil {
            return false
        } else if lhs.rawValue == rhs.rawValue {
            return lhs.cardRank! < rhs.cardRank!
        }
        
        switch (lhs, rhs) {
        case (_, .fourCard): return true
        case (_, .straight): return true
        case (_, .triple): return true
        case (_, .twoPair): return true
        case (.straight, _): return false
        case (.triple, _): return false
        case (.twoPair, _): return false
        case (.onePair, _): return false
        default: return true
        }
    }
}
