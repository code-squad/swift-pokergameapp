import Foundation

class Card : CustomStringConvertible{
    private let suit : Suit
    private let rank : Rank
    
    init(suit : Suit, rank : Rank){
        self.suit = suit
        self.rank = rank
    }
    var description: String{
        return "\(suit)\(rank)"
    }
    
    enum Suit : String, CustomStringConvertible, CaseIterable {
        var description: String{
            return "\(self.rawValue)"
        }
        case spade = "♠︎", club = "♣︎", heart = "♥︎", diamond = "♦︎"
    }

    enum Rank : Int, CustomStringConvertible, CaseIterable{
        var description: String {
            switch self {
            case .A:
                return "A"
            case .J:
                return "J"
            case .Q:
                return "Q"
            case .K:
                return "K"
            default:
                return "\(self.rawValue)"
            }
        }
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
    }

}


