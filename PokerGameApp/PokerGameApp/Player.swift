//
//  Player.swift
//  PokerGameApp
//
//  Created by 오킹 on 2021/02/18.
//

import Foundation

class Player: Playable {
    private var cards = [Card]()
    
    public func reciveCard(_ card: Card) {
        cards.append(card)
    }
    
    public func showCards() -> [Card] {
        return cards
    }
    
    public func dropMyCards() {
        cards.removeAll()
    }
}
