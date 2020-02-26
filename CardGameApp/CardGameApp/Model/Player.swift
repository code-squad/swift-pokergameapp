//
//  Gamer.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Player {
    
    private var cards: Hands = Hands()
    private var identifier: String
    var description: String {
        return identifier
    }
    var count: Int {
        return cards.count
    }
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    func addCard(card: Card?) {
        cards.add(card)
    }
    
    func removeLast() {
        cards.removeLast()
    }
    
    func clearCards() {
        cards.clearCards()
    }
    
    func forEach(handler: (Card) -> Void) {
        cards.forEach { handler($0) }
    }
}
