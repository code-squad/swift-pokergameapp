import Foundation

class Card: CustomStringConvertible {
    let suit: Suit
    let rank: Rank
    
    init(suit:Suit, rank:Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    /*
     공통적인 타입을 가진 관련있는 값의 그룹을 묶기 위하여 enum타입을 활용
     CaseIterable을 활용하여 enum이 갖는 모든 case를 배열로 생성
    */
    enum Suit: String, CaseIterable, CustomStringConvertible {
        case spades = "♠️"
        case heart = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        var description: String { return rawValue }
    }
    
//    클래스를 통해(인스턴스화 하지 않고) 호출할 수 있는 키워드(static)활용
//    하기와 같이 코딩해야하는 걸 Caseiterable을 활용하면 자동으로 모든 case에 대한 배열 생성
//    static var allCases: [Suit] {
//        return [.spades, .clubs, .diamonds, .heart]
//    }
    
    enum Rank: Int, CaseIterable, CustomStringConvertible {
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
        
        var description: String {
            switch self {
            case .Ace: return "ACE"
            case .J: return "J"
            case .Q: return "Q"
            case .K: return "K"
            default: return "\(rawValue)"
            }
        }
    }
    
//    static var allCases: [Rank] {
//        return [.Ace, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .J, .Q, .K]
//    }
    
    var description: String {
        return "\(suit)\(rank)"
    }
}
