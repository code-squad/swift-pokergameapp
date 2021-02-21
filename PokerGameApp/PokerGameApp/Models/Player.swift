//
//  Player.swift
//  PokerGameApp
//
//  Created by zombietux on 2021/02/16.
//

import UIKit

class Player: Playable {
    private var hand: Hand
    let name: String
    
    init(hand: Hand, name: String) {
        self.hand = hand
        self.name = name
    }
    
    func makeHand() -> [UIImageView] {
        return hand.makeCardImage()
    }
}
