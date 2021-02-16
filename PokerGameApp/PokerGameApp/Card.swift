//
//  Card.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/16.
//

import Foundation

class Card {
    enum Suit: Character, CaseIterable {
        case spades = "♠"
        case hearts = "♡"
        case diamonds = "♢"
        case clubs = "♣"
    }
    
    enum Rank: String, CaseIterable {
        case one = "A", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", ten = "10", eleven = "J", twelve = "Q", thirteen = "K"
    }
    
}


