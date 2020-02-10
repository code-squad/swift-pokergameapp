//
//  Card.swift
//  CardGameApp
//
//  Created by JW on 2020/02/10.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    enum Suit: Character {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
    }
    
    enum Rank: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten
        case eleven, twelve, thirteen
    }
    
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    func convertRankValueToString() -> String{
        let rankString: String
        switch self.rank {
        case .one:
            rankString = "A"
        case . eleven:
            rankString = "J"
        case .twelve:
            rankString = "Q"
        case .thirteen:
            rankString = "K"
        default:
            rankString = "\(self.rank.rawValue)"
        }
        return rankString
    }
    
    var description: String {
        return "\(suit.rawValue)\(convertRankValueToString())"
    }
}


