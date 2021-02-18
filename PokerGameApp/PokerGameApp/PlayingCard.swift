//
//  PlayingCard.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/17.
//

import Foundation

///enum을 사용한 이유는, 사용되는 문양의 case가 적으며, 해당 case외에는 없고, CaseIterable을 이용하여 random한 값을 가져올 수 있기 때문입니다.
enum Suits : String, CaseIterable {
    case spade = "\u{2660}"
    case heart = "\u{2665}"
    case diamond = "\u{2666}"
    case club = "\u{2663}"
}

extension Suits : CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}
/// rank입력 케이스에 오류가 없게하기 위해 enum case로 변경.
enum Rank : Int, CaseIterable, CustomStringConvertible {
    
    case one, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
         
    var description: String {
        switch self {
        case .one:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(self.rawValue)
        }
    }
}

class PlayingCard : CustomStringConvertible{
    
    var description: String {
        return "\(suit)\(number)"
    }
    
    let suit : Suits
    let number : Rank
    
    init(suit : Suits, number : Rank) {
        self.suit = suit
        self.number = number
    }
    
    deinit {
        print("card is deinit\(self.description)")
    }
    
    convenience init() {
        self.init(suit: Suits.allCases.randomElement()!,number: Rank.allCases.randomElement()!)
    }
}
