//
//  CardModel.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Card {
    
    // class는 더 많은 기능을 사용할때 사용할 거 같았습니다. enum은 작은 범위를 나눌때 유용했습니다.
    enum suit: String {
        case spade = "♤"
        case hert = "❤"
        case club = "♧"
        case diamond = "⬦"
    }
    
    enum rank: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
    }
    // switch문 빼려고 사용했습니다. 이 방법이 최선은 아니지만 간단한 경우 고려해볼만한 거 같았습니다.
    private let dictionary: [rank: String] = [
        .one: "A",
        .eleven : "J",
        .twelve : "Q",
        .thirteen : "K",
    ]
    private var suit: suit
    private var rank: rank
    
    init(suit: suit, rank: rank) {
        self.suit = suit
        self.rank = rank
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        guard let rank = dictionary[self.rank] else {
            return "\(self.suit.rawValue)\(self.rank.rawValue)"
        }
        return "\(self.suit.rawValue)\(rank)"
    }
}

