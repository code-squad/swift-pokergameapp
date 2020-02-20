//
//  Player.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Player: Playable {
    private var hands = Hands()
    
    func appendCard(_ card: Card) {
        hands.append(card)
    }
    
    func forEachCard(handler: (Card) -> () ) {
        hands.forEach(handler)
    }
    
    func result() -> Hands.GameResult {
        guard let result = hands.judgeResult() else { return Hands.GameResult.none }
        return result
    }
}
