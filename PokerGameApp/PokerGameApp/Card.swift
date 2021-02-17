//
//  cardNum.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/17.
//

import Foundation

//지정된 범위 안의 값만을 사용해야 하기 때문에 enum을 사용, 예를들면 다른 ☞모양은 사용X
enum Shape: Character {
    case spade = "♠️"
    case clover = "♣️"
    case diamond = "♦️"
    case heart = "♥️"
}

//지정된 범위 안의 값만을 사용해야 하기 때문에 enum을 사용, 예를들면 14라는 숫자는 사용X
enum Number: Int {
    case A = 1
    case two
    case three
    case four
    case five
    case sixth
    case seven
    case eight
    case nine
    case ten
    case J
    case Q
    case K
}

class Card {
    let shape: Shape
    let number: Number
    
    init(shape: Shape, number: Number) {
        self.shape = shape
        self.number = number
    }
}
