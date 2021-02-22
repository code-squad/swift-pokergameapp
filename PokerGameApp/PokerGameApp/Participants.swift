//
//  Participants.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/18.
//

import Foundation

class Participants {
    
    private var list = [Participant]()
    
    init(playerCount: Int, dealer: Dealer) {
        for i in 1...playerCount {
            list.append(Player(number: i))
        }
        list.append(dealer)
    }
    
    func takeCard(from stacks: [[Card]]) {
        for (i, cards) in stacks.enumerated() {
            list[i].updateStack(with: cards)
        }
    }
    
    func names() -> [String] {
        return list.map{ $0.myName() }
    }

    func stacks() -> [[Card]] {
        return list.map{ $0.myStack() }
    }

    func count() -> Int {
        return list.count
    }
}
