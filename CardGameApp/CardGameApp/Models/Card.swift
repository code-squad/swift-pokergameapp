//
//  Card.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/06.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Card {
    enum Suit: String, CaseIterable {
        case heart = "h"
        case diamond = "d"
        case club = "c"
        case spade = "s"
    }
    
    enum Rank: Int, CaseIterable {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
    
    private let suit: Suit
    private let rank: Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(suit)\(rank)"
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit
            && lhs.rank == rhs.rank
    }
}

extension Card.Suit: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}

extension Card.Rank: CustomStringConvertible {
    static private let numberFormattingDictionary: Dictionary<Card.Rank, String> = [
        .ace: "A",
        .jack: "J",
        .queen: "Q",
        .king: "K"]
    
    var description: String {
        if let picture = Card.Rank.numberFormattingDictionary[self] {
            return picture
        }
        return "\(rawValue)"
    }
}
