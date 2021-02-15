import Foundation

// Card가 가질 수 있는 값이 졍해져있기 때문에 enum으로 구현했습니다
/// Shape와 Rank 속성 모두 초기화 시 값을 정할 수 있기 때문에 구현을 하게 됐는데
/// 만약 인스턴스 생성 시 속성 값의 범위가 넓거나 예측 불가능하다면 struct로 구현하려 고민했을 것 같습니다.
class Card {
    enum Shape: String, CustomStringConvertible {
        case clubs = "♣️"
        case diamone = "♦️"
        case hearts = "❤️"
        case spades = "♠️"
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    enum Rank: Int, CustomStringConvertible {
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
    
    init(_ shape: Shape, _ rank: Rank) {
        self.shape = shape
        self.rank = rank
    }
}


extension Card: CustomStringConvertible {
    var description: String {
        return "\(shape)\(rank)"
    }
}
