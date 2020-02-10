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

class Card{
    enum Suit:Character{
        case spade = "♠️"
        case clover = "♣️"
        case heart = "♥️"
        case diamond = "♦️"
    }
    
    enum Rank:Int{
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
