//
//  Ranks.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/03/05.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct Ranks {
    private var ranks: [Rank]
    
    init(cards: [Card]) {
        ranks = Rank.checkCombiAndGenerateRanks(with: cards)
    }
}

extension Ranks: Comparable {
    
    static func == (lhs: Ranks, rhs: Ranks) -> Bool {
        guard lhs.ranks.count == rhs.ranks.count else {
             return false
         }
         
        for index in 0 ..< lhs.ranks.count {
            guard lhs.ranks[index] == rhs.ranks[index] else {
                 return false
             }
         }
         return true
     }
    
    static func < (lhs: Ranks, rhs: Ranks) -> Bool {
        
        let min = lhs.ranks.count > rhs.ranks.count ? lhs.ranks.count : rhs.ranks.count
        for index in 0 ..< min {
            if lhs.ranks[index].combination != rhs.ranks[index].combination {
                return lhs.ranks[index].combination < rhs.ranks[index].combination
            }
        }
        
        if lhs.ranks.count > min {
            return false
        }
        
        if rhs.ranks.count > min {
            return true
        }
        
        for index in 0 ..< min {
            if lhs.ranks[index].card != rhs.ranks[index].card {
                return lhs.ranks[index].card < rhs.ranks[index].card
            }
        }
        return false
    }
}
