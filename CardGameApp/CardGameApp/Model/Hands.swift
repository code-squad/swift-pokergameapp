//
//  Hands.swift
//  CardGameApp
//
//  Created by delma on 18/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Hands {
    private var hands = [Card]()
    
    func append(_ card: Card) {
        hands.append(card)
    }
    
    func forEach(_ handler: (Card) -> Void ) {
        hands.forEach(handler)
    }
    
    func count() -> Int {
        return hands.count
    }
    
    func shuffle() {
        hands.shuffle()
    }
    
    func removeOne() -> Card? {
        return hands.removeFirst()
    }
}
