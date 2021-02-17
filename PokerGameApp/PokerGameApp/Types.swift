//
//  Types.swift
//  PokerGameApp
//
//  Created by 지북 on 2021/02/17.
//

import Foundation

enum Suit: Character, CustomStringConvertible, CaseIterable {
    case spades = "♠️", hearts = "❤️", diamonds = "♦️", clubs = "♣️"
    
    var description: String {
        return "\(self.rawValue)"
    }
}

enum Rank: Int, CustomStringConvertible, CaseIterable{
    case A = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, J, Q, K
    
    var description: String {
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

enum Capacity : Int{
    case two = 2, three, four
}

enum Event : Int {
    case fiveStudPocker = 5
    case sevenStudPocker = 7
}
