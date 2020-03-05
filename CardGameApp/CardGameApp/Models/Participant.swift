//
//  Playerable.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation
extension Participant {
    func searchRank(handler: (Rank) -> (Void)) {
        ranks.forEach{ handler($0) }
    }
}

extension Participant: Comparable {
    
    static func < (lhs: Participant, rhs: Participant) -> Bool {
        var lhsRanks = [Rank]()
        lhs.searchRank {
            lhsRanks.append($0)
        }
        
        var rhsRanks = [Rank]()
        rhs.searchRank {
            rhsRanks.append($0)
        }
        
        let min = lhsRanks.count > rhsRanks.count ? lhsRanks.count : rhsRanks.count
        for index in 0 ..< min {
            if lhsRanks[index].combination != rhsRanks[index].combination {
                return lhsRanks[index].combination < rhsRanks[index].combination
            }
        }
        
        if lhsRanks.count > min {
            return false
        }
        
        if rhsRanks.count > min {
            return true
        }
        
        for index in 0 ..< min {
            if lhsRanks[index].card != rhsRanks[index].card {
                return lhsRanks[index].card < rhsRanks[index].card
            }
        }
        return false
    }
    
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        var lhsRanks = [Rank]()
        lhs.searchRank {
            lhsRanks.append($0)
        }
        
        var rhsRanks = [Rank]()
        rhs.searchRank {
            rhsRanks.append($0)
        }
        
        guard lhsRanks.count == rhsRanks.count else {
            return false
        }
        
        for index in 0 ..< lhsRanks.count {
            guard lhsRanks[index] == rhsRanks[index] else {
                return false
            }
        }
        return true
    }
    
}

class Participant {
    
    let name: String
    var cardsCount: Int {
        return cards.count
    }
    private var ranks = [Rank]()
    private var cards = [Card]()
    
    
    init(name: String) {
        self.name = name
    }
    
    func reset() {
        cards = [Card]()
        ranks = [Rank]()
    }
    
    func receive(card: Card) {
        cards.append(card)
    }

}

extension Participant: CardSearchable {
    
    func searchCard(handler: (Card) -> (Void)) {
        cards.forEach{ handler($0) }
    }
    
}

extension Participant {
    
    func updateRanks() {
        ranks = Rank.checkCombiAndGenerateRanks(with: cards)
    }
}
