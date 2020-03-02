//
//  Rank.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

enum Rank: Int, CaseIterable, Comparable {
    case onePair = 1
    case twoPair = 2
    case triple = 3
    case straight = 6
    case fourCard = 8
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
