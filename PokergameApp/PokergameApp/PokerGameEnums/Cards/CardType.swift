//
//  CardType.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

enum CardType: String, CustomStringConvertible, CaseIterable{
    case spade
    case heart
    case diamond
    case clover
    
    var description: String{
        switch self{
        case .spade:
            return "s"//"♠️"     //"\u{2663}"
        case .heart:
            return "h"//"♥️"     //"\u{2764}"
        case .diamond:
            return "d"//"🔶"     //"\u{2666}"
        case .clover:
            return "c"//"☘"     //"\u{2618}"
        }
    }
}
