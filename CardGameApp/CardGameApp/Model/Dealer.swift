//
//  Dealer.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Dealer: Player {
    private var cardDeck = CardDeck()
    private var hands = Hands()
    private var isWinner = false
    
    func removeOne() -> Card? {
        return cardDeck.removeOne()
    }
    
    func leftCards() -> Int {
        return cardDeck.count()
    }
    
    override func appendCard(_ card: Card) {
        hands.append(card)
    }
    
    func shuffle() {
        cardDeck.shuffle()
    }
    
    func forEach(handler: (Card) -> () ) {
        hands.forEach(handler)
    }
    
   override func result() -> Hands.GameResult {
        return hands.judgeResult()
    }

   override func winGame() {
        isWinner = true
    }

   override func sortCards() -> [Card] {
           return hands.sortCards()
    }
       
}
