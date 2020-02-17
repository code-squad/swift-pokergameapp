//
//  Descriptions.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Descriptions {
    enum Rule: CustomStringConvertible {
        case seven, five
        
        var description: String {
            switch self {
            case .seven: return "7 Cards"
            case .five: return "5 Cards"
            }
        }
    }

    enum Number: CustomStringConvertible {
        case two, three, four
        
        var description: String {
            switch self {
            case .two: return "2명"
            case .three: return "3명"
            case .four: return "4명"
            }
        }
    }
    
    static let maxPlayers = 5
    static let maxCards = 7
    
    static let playerLabel = "Player"
    static let dealerLabel = "Dealer"
}
