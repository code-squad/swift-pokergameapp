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
    //  rawValue나 이를 유니코드로 변환한 것만 출력하면 된다고 생각해 이 구조를 택했습니다.
    enum Suit: Character {
        case spades = "♠", hearts = "♥", diamonds = "♦", clubs = "♣"
    }
    
    //  제 생각에는 카드를 구별할 때 인스턴스의 rawValue를 알아내서 구별하기 보다는
    //  타입으로 구별을 하는 일이 많을 것 같아서 타입의 rawValue는 유니코드로 구현해서
    //  이를 출력할 때 J,Q,K를 보여주도록 바꿨습니다.
    enum Rank: Int {
        case one = 49, two, three, four, five, six, seven, eight, nine, ten
        case jack = 74, queen = 81, king = 75
    }
    
    let suit:Suit, rank:Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    //  rank.rawValue는 범위가 제한되어 있어 과감하게 !로 옵셔널을 해제했습니다.
    func cardInfo() -> String {
        return "\(self.suit.rawValue)\(UnicodeScalar(self.rank.rawValue)!)"
    }
}
