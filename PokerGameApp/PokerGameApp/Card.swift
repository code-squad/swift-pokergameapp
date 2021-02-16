//
//  Card.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/16.
//

import Foundation

class Card {
    let cardDescription: String
    
    enum Suit: Character, CaseIterable {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clovers = "🍀"
    }
    
    enum Value: String, CaseIterable {
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case jack = "J"
        case queen = "Q"
        case king = "K"
        case ace = "A"
    }
   
    init(suit: Suit, value: Value) {
        self.cardDescription = "\(suit.rawValue)\(value.rawValue)"
    }
}

