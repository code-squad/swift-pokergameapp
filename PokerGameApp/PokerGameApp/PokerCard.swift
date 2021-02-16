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
    enum Suit: Character, CaseIterable {
        case spades = "♠", hearts = "♥", diamonds = "♦", clubs = "♣"
    }
    
    enum Rank: Int, CaseIterable {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
    }
    
    let suit:Suit, rank:Rank
    
    var description: String {
        var over10: Character
        switch self.rank {
        case .one:
            over10 = "A"
        case .jack:
            over10 = "J"
        case .queen:
            over10 = "Q"
        case .king:
            over10 = "K"
        default:
            return "\(self.suit.rawValue)\(self.rank.rawValue)"
        }
        return "\(self.suit.rawValue)\(over10)"
    }
    
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
}
