//
//  PlayerType.swift
//  cardGameRefactor
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

enum PlayerType: Int, CustomStringConvertible {
    case two = 2
    case three = 3
    case four = 4
    
    init (_ number: Int) throws {
        switch number {
        case 1:
            self = .two
        case 2:
            self = .three
        case 3:
            self = .four
        default:
            throw GameMenuError.outOfRangeMenu
        }
    }
    init (_ segmentedControlTitle: String) throws {
        switch segmentedControlTitle {
        case "2명":
            self = .two
        case "3명":
            self = .three
        case "4명":
            self = .four
        default:
            throw GameMenuError.outOfRangeMenu
        }
    }
    var description: String {
        switch self {
        case .two:
            return "2명"
        case .three:
            return "3명"
        case .four:
            return "4명"
        }
    }
}
