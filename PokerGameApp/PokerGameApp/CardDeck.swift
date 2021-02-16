//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 서우석 on 2021/02/16.
//

import Foundation
struct CardDeck {
    
    private var deckOfCard = [Card]()
    
    func countCard() -> Int {
        return self.deckOfCard.count
    }
}
