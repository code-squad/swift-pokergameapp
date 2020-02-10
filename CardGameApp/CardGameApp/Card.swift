//
//  Card.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/10.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class Card {
    
    let suit : Suit
    let rank : Rank
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    enum Suit: Character {// 한글자이기 때문에 캐릭터라고 했는데 String도 됨.
        case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
    }
    
    enum Rank: Int {
        case  A=1, two=2,three=3,four=4,five=5,six=6,seven=7,eight=8,nine=9,ten=10,J=11, Q=12, K=13
    }
}
