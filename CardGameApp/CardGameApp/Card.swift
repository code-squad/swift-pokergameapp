//
//  Card.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/10.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class Card {
    
    let suit : Suit.RawValue
    let rank : Rank.RawValue
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit.rawValue
        self.rank = rank.rawValue
    }
    
    enum Suit: Character {  // 한글자이기 때문에 캐릭터라고 했는데 String도 됨.
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
    }
    
    enum Rank: UInt {
        case A = 1, two, three, four, five, six, seven, eight, nine, ten, J, Q, K
    }
    
    func descripteCard() -> String{
        let description = "\(self.suit)\(self.rank)"
        return description
    }
    
}
