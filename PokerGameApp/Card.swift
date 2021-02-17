//
//  PlayingCard.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import Foundation

struct Card : CustomStringConvertible {
    
    var suit : Suit
    var rank : Rank
    var description: String {
        return "\(suit)\(rank)"
    }
    
    enum Suit : String, CustomStringConvertible, CaseIterable {
        case spades = "♠️"
        case hearts = "❤️"
        case clubs = "♣️"
        case dimonds = "♦️"
        
        var description: String { return rawValue}
    }
    
    enum Rank : Int, CustomStringConvertible, CaseIterable {
        
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
        var description : String {
            switch self {
            case .ace: return "A"
            case .jack : return "J"
            case .queen : return "Q"
            case .king : return "K"
            default:
                return String(self.rawValue)
            }
        }
    
    }
}
