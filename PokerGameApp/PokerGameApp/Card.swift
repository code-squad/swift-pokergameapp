import Foundation

class Card: CustomStringConvertible {
    let suit: Suit
    let rank: Rank
    
    init(suit:Suit, rank:Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    // 공통적인 타입을 가진 관련있는 값의 그룹을 묶기 위하여 enum타입을 활용
    enum Suit: Character {
        case spades = "♠️"
        case heart = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
    }
    
    enum Rank: Int {
        case Ace = 1
        case Two
        case Three
        case Four
        case Five
        case Six
        case Seven
        case Eight
        case Nine
        case Ten
        case J
        case Q
        case K
    }
    
    var description: String {
        switch self.rank {
        case .Ace, .J, .Q, .K:
            return "\(suit.rawValue)\(rank)"
        default:
            return "\(suit.rawValue)\(rank.rawValue)"
        }
    }
}
