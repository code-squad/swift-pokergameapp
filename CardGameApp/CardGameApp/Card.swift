//
//  Card.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/14.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

struct Card {
    enum Suit: Character {
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
    }

    enum Rank: Int {
        case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
    }

    let suit: Suit?, rank: Rank?
}
