//
//  CardDeck.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/11.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

struct CardDeck {
    var cards: [Card]
    
    func reset() {
        
    }
    
    func shuffle() {
        
    }
    
    func removeOne() -> Card {
        
    }
    
    func count() {
        
    }
}
extension CardDeck :Equatable{
    static func == (lhs: CardDeck, rhs: CardDeck) -> Bool {
        return lhs.cards.count == rhs.cards.count
        return lhs.cards == rhs.cards
        
    }
}
