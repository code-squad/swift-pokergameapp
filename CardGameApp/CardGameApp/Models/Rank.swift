//
//  Rank.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/03.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct Rank: Comparable {
    
    let card: Card
    let combination: Combination
    
    static func == (lhs: Rank, rhs: Rank) -> Bool {
        return (lhs.combination == rhs.combination) &&
            (lhs.card == rhs.card)
    }
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        if lhs.combination == rhs.combination {
            return lhs.card < rhs.card
        }
        return lhs.combination < rhs.combination
    }
    
}

extension Rank {
    
    enum Combination: Int, CaseIterable, Comparable {
        case oneCard = 0
        case onePair
        case twoPair
        case triple
        case straight
        case fourCard
        
        static func < (lhs: Combination, rhs: Combination) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
    }
    
}

