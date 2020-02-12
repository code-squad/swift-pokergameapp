//
//  CardModel.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

final class Card {
    // class는 더 많은 기능을 사용할때 사용할 거 같았습니다. enum은 작은 범위를 나눌때 유용했습니다.
    enum suit: String, CaseIterable {
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

struct Deck {
    
    private var cards: [Card] = []
    
    var count: Int {
        return cards.count
    }
    
    init() {
        makeDeck()
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func removeOne() -> Card? {
        cards.popLast()
    }
    
    mutating func reset() {
        cards.removeAll()
        
    }
    
    private func makeSuit(suit: Card.suit) -> [Card] {
        return (1...13).map {
            Card(suit: suit, rank: Card.rank(rawValue: $0)!)
        }
    }
    
    private mutating func makeDeck() {
        Card.suit.allCases.forEach {
            cards.append(contentsOf: makeSuit(suit: $0))
        }
    }
}
