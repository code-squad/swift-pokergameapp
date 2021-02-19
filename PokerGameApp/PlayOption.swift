//
//  InputView.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/17.
//

import Foundation

struct PlayOption {
    enum PlayersCount : Int, CaseIterable, CustomStringConvertible {
        case none = 0, one, two, three, four
        
        var description: String {
            return "\(self.rawValue)명"
        }
    }

    enum CardStud : Int, CaseIterable, CustomStringConvertible {
        case none = 0
        case five = 5
        case seven = 7
        
        var description: String {
            return "\(self.rawValue) Cards"
        }
    }
}
