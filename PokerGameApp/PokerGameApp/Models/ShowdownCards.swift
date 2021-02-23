//
//  ShowdownCards.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/19.
//

import Foundation

struct ShowdownCards {
    
    private(set) var owner: Player
    private let setOfCards: [Card]
    
    init(owner: Player, setOfCards: [Card]) {
        self.owner = owner
        self.setOfCards = setOfCards
    }
    
    func showCards(handler: (Card) -> ()) {
        setOfCards.forEach { handler($0) }
    }
}
