import Foundation

class Card : CustomStringConvertible{
    private let suit : Suit
    private let number : Number
    
    init(suit : Suit, number : Number){
        self.suit = suit
        self.number = number
    }
    var description: String{
        return "\(suit)\(number)"
    }
}

enum Suit : String, CustomStringConvertible, CaseIterable {
    var description: String{
        return "\(self.rawValue)"
    }
    //case spade = "♠︎", club = "♣︎", heart = "♥︎", diamond = "♦︎"
    case spade = "s", club = "c", heart = "h", diamond = "d"
}

enum Number : Int, CustomStringConvertible, CaseIterable{
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

