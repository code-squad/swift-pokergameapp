//
//  Player.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/08.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Player {
    private var _hand: [Card] = []
    var hand: [Card] {
        _hand
    }
    
    private var _name: String!
    var name: String {
        _name
    }
    
    func setupHand(with hand: [Card]) {
        self._hand = hand
    }
    
    func setupName(_ name: String) {
        self._name = name
    }
    
    func forEachCard(_ handler: (Card) -> ()) {
        for card in _hand {
            handler(card)
        }
    }
}
