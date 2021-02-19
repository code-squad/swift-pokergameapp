//
//  InputView.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/17.
//

import Foundation

struct PlayOption {
    enum PlayersCount : Int, CaseIterable, CustomStringConvertible {
        case none, one, two, three, four
        
        var description: String {
            switch self {
            case .one: return "1명"
            case .two: return "2명"
            case .three: return "3명"
            case .four : return "4명"
            default:
                return "0명"
            }
        }
    }

    enum CardStud : Int, CaseIterable, CustomStringConvertible {
        case none = 0
        case five = 5
        case seven = 7
        
        var description: String {
            switch self {
            case .five: return "5 Cards"
            case .seven: return "7 Cards"
            default:
                return "0 Cards"
            }
        }
    }
}
