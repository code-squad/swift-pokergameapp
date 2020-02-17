//
//  card.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/10.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Card{
    
    /**
     enum을 채택한 이유
     card 클래스를 최초 생성할 때 어떤 값이 들어가는지에 대해 명확히 하고, 값을 제한할 수 있음.
     초기에 딕셔너리를 사용하려 했으나, 이 경우 어떤 값이 들어가는지 제한 할 수 없으며, 명확하지 않음
     예를 들어 ace를 0으로 표현할수도, 13으로 표현할 수도 있기 때문에 enum을 사용하여 이 점을 명확히 해줌.
     */
    enum Suit: String, CaseIterable{
        case spade = "s"
        case clover = "c"
        case heart = "h"
        case diamond = "d"
    }
    
    enum Rank: Int, CaseIterable{
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
    
    private let rank: Rank
    private let suit: Suit
    
    init(rank: Rank, suit: Suit){
        self.rank = rank
        self.suit = suit
    }
}

extension Card: CustomStringConvertible{
    var description: String {
        var rankString = ""
        switch rank.rawValue {
        case 1:
            rankString = "A"
            break
        case 11:
            rankString = "J"
        case 12:
            rankString = "Q"
        case 13:
            rankString = "K"
        default:
            rankString = String(rank.rawValue)
        }
        return self.suit.rawValue + rankString
    }
}

extension Card: Equatable{
    static func == (lhs: Card, rhs: Card) -> Bool {
        return (lhs.rank == rhs.rank) && (lhs.suit == rhs.suit)
    }
}
