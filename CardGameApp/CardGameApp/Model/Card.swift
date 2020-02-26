//
//  Card.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/10.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    
    private var suit : Suit
    private var rank : Rank
    var description: String {
            return "\(suit.description)\(descripteAlphabetRank(rank: rank))"
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    //enum을 선택한 이유:
    //1. 카드의 Rank와 Suit는 이미 정해져 있고(추후 수정되거나 추가되지 않기 때문에) 각각 같은 한 타입이기 때문에 배열이나 딕셔너리가 아닌 enum을 선택했습니다.
    //
    //2. 사실 지금 메모리를 고려하는게 맞는지 모르겠지만 클래스 같은 경우에는 인스턴스 생성 후 인스턴스를 해지하지 않으면 메모리에 계속 남아있지만 enum은 사용을 다하면 자동으로 스택에서 사라지기 때문에 enum이 더 낫다고 생각했습니다.
    //
    //3. 프로퍼티를 호출할 때 클래스에서는 프로퍼티를 호출할 때 마다 "Suit().hearts" 이런 식으로 명시해줘야 하지만 enum은 추론 가능할 때 ".eight"과 같이 표현할 수 있어서 더 편하다고 생각했습니다.
    
    enum Suit: Character, CaseIterable, CustomStringConvertible {
        case spades = "s" , hearts = "h", diamonds = "d", clubs = "c"
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    enum Rank: UInt, CaseIterable, CustomStringConvertible {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    func descripteAlphabetRank(rank: Rank) -> String {
        switch rank {
        case .A : return "A"
        case .J : return "J"
        case .Q : return "Q"
        case .K : return "K"
        default :
            return rank.description
        }
    }
    
}
extension Card :Equatable{
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit && lhs.suit == rhs.suit
    }
}
