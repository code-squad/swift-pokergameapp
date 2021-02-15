//
//  PlayingCard.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import Foundation

struct PlayingCard : CustomStringConvertible {
    
    var suit : Suit
    var rank : Rank
    var description: String {
        return "\(suit)\(rank)"
    }
    
    // Suit는 PlayingCard에서만 사용되는 모양에 대한 클래스이므로 Nested Enum으로 설계한다.
    enum Suit : String, CustomStringConvertible {
        case spades = "♠️"
        case hearts = "❤️"
        case dimonds = "♣️"
        case clubs = "♦️"
        
        var description: String { return rawValue}
        static var all : [Suit] = [.hearts, .clubs, .dimonds, .spades]
    }
    
    // Rank는 PlayingCard에서만 사용되는 모양에 대한 클래스이므로 Nested Enum으로 설계한다.
    enum Rank : CustomStringConvertible {
        
        case ace
        case face(String)
        case numeric(Int)
        
        var description : String {
            switch self {
            case .ace: return "A"
            case .numeric(let pips) : return String(pips)
            case .face(let kind): return kind
            }
        }
        
        static var all: [Rank] {
            var allranks = [Rank.ace]
            for num in 2...10 {
                allranks.append(Rank.numeric(num))
            }
            allranks += [Rank.face("K"), Rank.face("Q"), Rank.face("J")]
            return allranks
        }
    }
}
