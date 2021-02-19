//
//  InputView.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/17.
//

import Foundation

struct PlayOption {
    enum PlayersCount : Int {
        case none, one, two, three, four
    }

    enum CardStud : Int {
        case five = 5
        case seven = 7
        case none = 0
    }
}
