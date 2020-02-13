//
//  Player.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/08.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Player {
    private var hand: [Card] = []
    
    func setupHand(with hand: [Card]) {
        self.hand = hand
    }
    
    func forEachCard(_ handler: (Card) -> ()) {
        for card in hand {
            handler(card)
        }
    }
}
