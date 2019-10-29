//
//  Shape.swift
//  CardGame
//
//  Created by Elena on 23/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//enum을 만들고 스위프트에게 allCases 배열을 자동으로 만들어달라고 하는 구조
// 모양에 따라 점수가 다르다는걸 알고 다시 구현하였다.
enum Shape: Int, CaseIterable {
    case club = 1, heart, diamond, spades
    //case spades = "♠️", heart = "♥️", diamond = "♦️", club = "♣️"
    
    var value: Character {
        switch self {
        case .club:
            return "♣️"
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        case .spades:
            return "♠️"
        }
    }
}

