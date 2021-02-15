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
    
    enum Suit: String {
        case spade = "\u{2660}"
        case club = "\u{2663}"
        case heart = "\u{2665}"
        case diamond = "\u{2666}"
    }
    
    /// 추후 크기 비교가 용이하도록 내부 rank는 Int 타입으로 설정하고,
    /// 출력 시에는 개별 메소드를 통해 A, J, Q, K 등 특수 경우 문자 변환
    let rankNum: Int
    
    init(suit: Suit, rank: Int) {
        self.suit = suit
        self.rankNum = rank
    }
}

//MARK: - 출력 관련
extension Card {
    func printCard() {
        print(suit.rawValue + printableRank(from: rankNum))
    }
    
    private func printableRank(from n: Int) -> String {
        switch n {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return String(n)
        }
    }
}
