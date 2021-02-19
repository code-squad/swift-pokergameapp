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
        
        init(rawValue : Int) {
            switch rawValue {
            case 0 : self = .one
            case 1 : self = .two
            case 2 : self = .three
            case 3 : self = .four
            default : self = .none
            }
        }
        static var allItems : [String] {
            return PlayersCount.allCases.filter{ $0 != .none}.map{($0.description)}
        }
    }

    enum CardStud : Int, CaseIterable, CustomStringConvertible {
        case none = 0
        case five = 5
        case seven = 7
        
        var description: String {
            return "\(self.rawValue) Cards"
        }
        
        init(rawValue : Int){
            switch rawValue {
            case 0 : self = .five
            case 1 : self = .seven
            default:
                self = .none
            }
        }
        static var allItems : [String] {
            return CardStud.allCases.filter{ $0 != .none}.map{($0.description)}
        }
    }
}
