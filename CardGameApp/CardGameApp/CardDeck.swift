//
//  CardDeck.swift
//  CardGameApp
//
//  Created by Cory Kim on 2020/02/06.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class CardDeck {
    private var cards: [Card] = []
    var count: Int {
        cards.count
    }
    
    init() {
        setupDeck()
    }
    
    private func setupDeck() {
        let suits: [Card.Suit] = [.club, .diamond, .heart, .spade]
        let ranks: [Card.Rank] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
        
        suits.forEach {
            let suit = $0
            ranks.forEach {
                cards.append(Card(suit: suit, rank: $0))
            }
        }
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func removeOne() -> Card? {
        guard cards.count > 0 else { return nil }
        return cards.removeLast()
    }
    
    func reset() {
        cards.removeAll()
        setupDeck()
    }
}
