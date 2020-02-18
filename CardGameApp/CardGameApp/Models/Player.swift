//
//  Player.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/08.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Player {
    private(set) var hand: Hand = Hand()
    private(set) var name: String
    
    init(name: String = "") {
        self.name = name
    }
    
    func takeCard(_ card: Card) {
        hand.appendCard(card)
    }
    
    func setupName(_ name: String) {
        self.name = name
    }
    
    func forEachCard(_ handler: (Card) -> ()) {
        hand.forEachCard(handler)
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.hand == rhs.hand
    }
}
