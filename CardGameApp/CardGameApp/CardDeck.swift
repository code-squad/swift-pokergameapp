//
//  CardDeck.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/06.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class CardDeck {
    var cards: [Card] = []
    var count: Int {
        get {
            return cards.count
        }
    }
    
    init() {
        setupDeck()
    }
    
    private func setupDeck() {
        let suits: [Card.Suit] = [.club, .diamond, .heart, .spade]
        let ranks: [Card.Rank] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
        
        for suitIndex in 0..<suits.count {
            for rankIndex in 0..<ranks.count {
                let card = Card(suit: suits[suitIndex], rank: ranks[rankIndex])
                cards.append(card)
            }
        }
    }
    
    func shuffle() {
        
    }
    
    func removeOn() {
        
    }
    
    func reset() {
        cards.removeAll()
        setupDeck()
    }
}
