//
//  Model.swift
//  PokerGameApp
//
//  Created by 한천희 on 2021/02/19.
//

import Foundation


class TrumpCard {
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    enum Rank: Int {
        case one, two = 2, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        
        struct Value {
            let firstDigit: Int?, secondCharacter: Character
        }
        
        var value: Value {
            switch self {
            case .one:
                return Value(firstDigit: nil, secondCharacter: "A")
            case .eleven:
                return Value(firstDigit: nil, secondCharacter: "J")
            case .twelve:
                return Value(firstDigit: nil, secondCharacter: "Q")
            case .thirteen:
                return Value(firstDigit: nil, secondCharacter: "K")
            default:
                return Value(firstDigit: self.rawValue, secondCharacter: "R")
            }
        }
    }
    
    
    let suit: Suit
    var rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    func result() -> String {
        if let firstDigit = rank.value.firstDigit {
            return "\(suit.rawValue)"+"\(firstDigit)"
        }
        return "\(suit.rawValue)"+"\(rank.value.secondCharacter)"

    }
}
