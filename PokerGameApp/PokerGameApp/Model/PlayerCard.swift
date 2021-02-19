//
//  PlayerCard.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/18.
//

import Foundation

struct PlayerCard {
    private(set) var cards : Deck
    private(set) var name : String
    
    init(name : String ,card : Deck) {
        self.name = name
        self.cards = card
    }
}
