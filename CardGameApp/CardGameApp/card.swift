//
//  card.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/10.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Card{
    enum Suit:Character{
        case spade = "♠️"
        case clover = "♣️"
        case heart = "♥️"
        case diamond = "♦️"
    }
    
    enum Rank:Int{
        case ace=1,two,three,four,five,six,seven,eight,nine,ten,jack,queen,king
    }
}
