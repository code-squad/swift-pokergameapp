//
//  ShowdownCards.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/19.
//

import UIKit

struct ShowdownCards {
    
    private let owner: Player
    private let setOfCards: [Card]
    
    init(owner: Player, setOfCards: [Card]) {
        self.owner = owner
        self.setOfCards = setOfCards
    }
    
    func getOwnerName() -> String {
        return owner.tellName()
    }
}
