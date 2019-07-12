//
//  Menu.swift
//  CardGame
//
//  Created by joon-ho kil on 5/23/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Menu: Int {
    case sevenCard = 1
    case fiveCard = 2
    case exit = 9
    
    func userCardCount () -> Int {
        switch self {
        case .exit: return 0
        case .fiveCard: return 5
        case .sevenCard: return 7
        }
    }
}
