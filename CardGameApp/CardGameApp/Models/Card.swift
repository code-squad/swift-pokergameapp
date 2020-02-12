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
        case heart = "♥️"
        case diamond = "♦️"
        case club = "♣️"
        case spade = "♠️"
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
    static private let numberFormattingDictionary: Dictionary<Rank, String> = [
        .ace: "A",
        .jack: "J",
        .queen: "Q",
        .king: "K"]
    
    var formattedNumber: String {
        if let string = Card.numberFormattingDictionary[rank] {
            return string
        }
        return "\(rank.rawValue)"
    }
    
    var description: String {
        return "\(suit.rawValue)\(formattedNumber)"
    }
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit
            && lhs.rank == rhs.rank
    }
}
