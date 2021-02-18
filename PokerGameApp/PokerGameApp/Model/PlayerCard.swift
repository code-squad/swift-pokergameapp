//
//  PlayerCard.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/18.
//

import Foundation

class PlayerCard {
    private let cards : Deck
    private let name : String
    
    init(name : String ,card : Deck) {
        self.name = name
        self.cards = card
    }
    
    func hasPlayerCardInfo() -> [String:Deck] {
        return [name:cards]
    }
    
    func showCards() -> [Card] {
        return cards.showCards()
    }
}
