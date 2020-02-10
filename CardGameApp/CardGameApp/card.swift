//
//  card.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/10.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

extension Card:CustomStringConvertible{
    var description: String {
        return String(self.suit.rawValue)+self.rankString
    }
}

extension Card:Equatable{
    static func == (lhs: Card, rhs: Card) -> Bool {
        if lhs.description == rhs.description{
            return true
        } else{
            return false
        }
    }
}

class Card{
    
    /**
     enum을 채택한 이유
     card 클래스를 최초 생성할 때 어떤 값이 들어가는지에 대해 명확히 하고, 값을 제한할 수 있음.
     초기에 딕셔너리를 사용하려 했으나, 이 경우 어떤 값이 들어가는지 제한 할 수 없으며, 명확하지 않음
     예를 들어 ace를 0으로 표현할수도, 13으로 표현할 수도 있기 때문에 enum을 사용하여 이 점을 명확히 해줌.
     */
    enum Suit:Character,CaseIterable{
        case spade = "♠️"
        case clover = "♣️"
        case heart = "♥️"
        case diamond = "♦️"
    }
    
    enum Rank:Int,CaseIterable{
        case ace=1,two,three,four,five,six,seven,eight,nine,ten,jack,queen,king
    }
    
    let rank:Rank
    let suit:Suit
    
    init(rank:Rank,suit:Suit){
        self.rank=rank
        self.suit=suit
    }
    
    var rankString:String{
        switch self.rank {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(self.rank.rawValue)
        }
    }
}
