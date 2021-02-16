//
//  PokerCard.swift
//  PokerGameApp
//
//  Created by user on 2021/02/16.
//

import Foundation

class PokerCard {

    //  PokerCard 클래스 내부에 Suit, Rank를 표현하는 코드가 있으면
    //  보기에 더 직관적일것 같아서 nested enum으로 구현했습니다.
    //  게다가 rawValue를 아래처럼 Character, Int로 정해주면 출력할 때
    //  rawValue만 출력해주면 편하다는 생각이 들어서 이 구조를 택했습니다.
    enum Suit: Character {
        case spades = "♠", hearts = "♥", diamonds = "♦", clubs = "♣"
    }
    
    enum Rank: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
    }
    
    let suit:Suit, rank:Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    func cardInfo() -> String {
        return "\(self.suit.rawValue)\(self.rank.rawValue)"
    }
}
