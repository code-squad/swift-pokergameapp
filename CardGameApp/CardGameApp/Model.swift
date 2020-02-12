//
//  CardModel.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

//MARK: - Card
class Card {
    
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

    private var suit: suit
    private var rank: rank
    
    init(suit: suit, rank: rank) {
        self.suit = suit
        self.rank = rank
    }
}

//MARK: - Deck
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
        makeDeck()
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

//MARK: - Extension
//MARK: Card
extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.suit.rawValue)\(self.rank)"
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit && lhs.rank == rhs.rank
    }
}

//MARK: Card.rank
extension Card.rank: CustomStringConvertible {
    var description: String {
        switch self {
        case .one: return "A"
        case .eleven: return "J"
        case .twelve: return "Q"
        case .thirteen: return "K"
        default: return String(rawValue)
        }
    }
}

//MARK: - Deck
extension Deck: Equatable {
    static func == (lhs: Deck, rhs: Deck) -> Bool {
        return lhs.cards == rhs.cards
    }
}
