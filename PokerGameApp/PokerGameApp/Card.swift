//
//  Card.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import Foundation

class Card {
    
    /// 4가지 경우 중 한가지를 선택한다는 개념을 나타내기에 적절한 enum 타입으로 생성
    /// init 시 가독성을 위해 영문으로 case 이름 생성, 출력을 위한 유니코드를 rawValue로 설정
    let suit: Suit
    
    enum Suit: String, CaseIterable {
        case spade = "\u{2660}"
        case club = "\u{2663}"
        case heart = "\u{2665}"
        case diamond = "\u{2666}"
    }
    
    /// 1~13까지만 설정 가능하도록 enum 통해 초기화하되,
    /// 내부 rank는 계산 편의성 위해 Int로 저장, 프린트용 변환은 개별 메소드로 구현
    let rank: Int
    
    enum Rank: Int, CaseIterable {
        case rank1 = 1,
             rank2, rank3, rank4, rank5, rank6, rank7,
             rank8, rank9, rank10, rank11, rank12, rank13
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank.rawValue
    }
}

//MARK: - 출력 관련
extension Card: CustomStringConvertible {
    var description: String {
        return "\(suit.rawValue)\(printableRank(from: rank))"
    }
    
    private func printableRank(from rank: Int) -> String {
        switch rank {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return String(rank)
        }
    }
}
