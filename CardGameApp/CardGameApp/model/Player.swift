//
//  Player.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/14.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Player {
    private(set) var name: String
    private(set) var handDeck = [Card]()
    private(set) lazy var score = Score(cardDeck: handDeck)
    
    init(name: String) {
        self.name = name
    }
    
    func bringCard(card: Card){
        self.handDeck.append(card)
    }
}

extension Player: Equatable {
    static func == (lhs:Player, rhs:Player) -> Bool {
        if lhs.score == rhs.score {
            return true
        }
        return false
    }
    
    static func < (lhs:Player, rhs:Player) -> Bool {
        if lhs.score < rhs.score {
            return true
        }
        return false
    }
}
