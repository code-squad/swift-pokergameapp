//
//  Player.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Player: CustomStringConvertible {
    var description: String {
        "Player\(number)"
    }
    private var number: Int
    private var hand = Hand()
    
    init(number: Int = 0) {
        self.number = number
    }
    
    func forEachCard(_ transform: (Card) -> ()) {
        hand.forEach(transform)
    }
    
    func discard() {
        hand = Hand()
    }
    
    func receive(_ card: Card) {
        hand.add(card: card)
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.hand == rhs.hand
    }
    
    static func > (lhs: Player, rhs: Player) -> Bool {
        lhs.hand > rhs.hand
    }
}
