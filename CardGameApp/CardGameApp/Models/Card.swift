//
//  Card.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/05.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Card {
    // 카드 객체의 모양을 저장할 suit는 Nested enum type인 Suit이다.
    // 카드 정보를 출력할 때 바로 Character를 반환해주기 위해 raw value는 Character를 사용하였다.
    // 카드 객체의 숫자(값)을 저장할 rank는 Nested enum type인 Rank이다.
    // 게임을 할 때에는 상대적인 값이 중요할 것 같아서 raw value를 Int로 정하고
    // toString()함수에서 출력 정보는 값에 따라 분류하였다.
    
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    enum Suit: Character, CaseIterable {
        case spade = "♠️"
        case heart = "♥️"
        case club = "♣️"
        case diamond = "♦️"
    }
    
    enum Rank: Int, CaseIterable {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit &&
            lhs.rank == rhs.rank
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        var rank = ""
        switch self.rank {
        case .jack:
            rank = "J"
        case .queen:
            rank = "Q"
        case .king:
            rank = "K"
        case .ace:
            rank = "A"
        default:
            rank = String(self.rank.rawValue)
        }
        return "\(suit.rawValue)\(rank)"
    }
}
