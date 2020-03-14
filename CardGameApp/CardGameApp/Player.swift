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
    private var cards = [Card]()
    
    func receive(_ hand: Card) {
        cards.append(hand)
    }
    
    func allCards() -> [Card] {
        return cards
    }
}
