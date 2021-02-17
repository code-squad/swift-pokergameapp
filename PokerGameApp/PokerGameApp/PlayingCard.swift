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

class PlayingCard : CustomStringConvertible{
    
    var description: String {
        return "\(suit)\(rank[number] ?? "nil")"
    }
    

    /// 카드의 숫자 또한 enum : CaseIterable 을 사용하려고 했지만, 각 case를 명명하는 것은 효율성이 떨어져 보였기 때문에, Dictionary를 택하였습니다. 범위 밖의 숫자를 입력 시  optional chaning을 이용하여 해결 할 수 있으므로 좋은 방법이라 보았습니다.
    private let rank : Dictionary<Int,String> = [1 : "A", 2 : "2", 3 : "3", 4 : "4", 5 : "5", 6 : "6", 7 : "7", 8 : "8", 9 : "9", 10 : "10", 11 : "J", 12 : "Q", 13 : "K"]
    
    let suit : Suits
    let number : Int
    
    init(suit : Suits, number : Int) {
        self.suit = suit
        self.number = number
    }
    
    convenience init() {
        self.init(suit: Suits.allCases.randomElement()!,number: Int.random(in: 1...13))
    }
}
