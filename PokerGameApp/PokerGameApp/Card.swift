import Foundation

struct Card : CustomStringConvertible{
    let suit : Suit
    let number : Number
    var description: String{
        return "\(suit)\(number)"
    }
}// struct는 초기화 해줄 필요도 없고 각각 카드가 복사되어 쓰이니까 struct로 사용하는 것이 더 적합하다고 판단

enum Suit : String, CustomStringConvertible, CaseIterable {
    var description: String{
        return "\(self.rawValue)"
    }
    case spade = "♠︎", club = "♣︎", heart = "♥︎", diamond = "♦︎"
}

enum Number : Int, CustomStringConvertible, CaseIterable{
    var description: String {
        switch self {
        /*case .A, .J, .Q, .K:
            return "\(self.rawValue)"*/ // 여기 그냥 enum의 고유 값을 반환할 수는 없나요?
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

