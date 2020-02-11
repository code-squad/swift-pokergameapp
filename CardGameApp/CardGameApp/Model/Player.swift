//
//  Player.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Player {
    private var cards = [Card]()
    
    func appendCard(_ card: Card) {
        cards.append(card)
    }
}
