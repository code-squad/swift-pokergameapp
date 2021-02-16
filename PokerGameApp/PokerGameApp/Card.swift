//
//  Card.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/16.
//

import Foundation

struct Card: CustomStringConvertible {
    var description: String {
        return "suit is \(suit.rawValue), rank is \(rank.values)"
    }
    
    enum Suit: Character {
        case spades = "♠️", hearts = "❤️", diamonds = "♦️", clubs = "♣️"
    }
    
    enum Rank: Int{
        case A = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, J, Q, K
        
        var values: String {
            let rankNumber = self.rawValue
            
            switch rankNumber {
            case 1:
                return "A"
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return "\(rankNumber)"
            }
        }
    }
    
    let rank:Rank, suit: Suit
}
