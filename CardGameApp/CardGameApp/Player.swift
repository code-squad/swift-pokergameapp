//
//  Player.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/25.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

protocol Playable {
    func receive(_ hand: Card)
}

class Player: Playable {
    private var hands = [Card]()
    
    func receive(_ hand: Card) {
        hands.append(hand)
    }
}
