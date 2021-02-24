//
//  PokerCard.swift
//  PokerGameApp
//
//  Created by user on 2021/02/16.
//

import Foundation

class PokerCard : CustomStringConvertible {

    //  PokerCard 클래스 내부에 Suit, Rank를 표현하는 코드가 있으면
    //  보기에 더 직관적일것 같아서 nested enum으로 구현했습니다.
    enum Suit: Character, CaseIterable, CustomStringConvertible {
        case spades = "♠", hearts = "♥", diamonds = "♦", clubs = "♣"
        
        var description: String {
            return "\(self.rawValue)"
        }
        
        var keyWord: String {
            switch self {
            case .clubs:
                return "c"
            case .diamonds:
                return "d"
            case .hearts:
                return "h"
            case .spades:
                return "s"
            }
        }
    }
    
    enum Rank: Int, CaseIterable, CustomStringConvertible {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten
        case jack
        case queen
        case king
        
        var description: String {
            switch self {
            case .one:
                return "A"
            case .jack:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            default:
                return "\(self.rawValue)"
            }
        }
        
    }
    
    let suit:Suit, rank:Rank
    
    var description: String {
        return "\(self.suit.keyWord)\(self.rank)"
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
}
