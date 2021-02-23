//
//  Dealer.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/18.
//

import Foundation

class Dealer: CustomStringConvertible {
    var description: String{
        return dealer.description
    }
    
    private var cardDeck = CardDeck()
    private(set) var dealer: [Card]
    
    init() {
        self.dealer = [Card]()
        cardDeck.makeCardDeck()
        cardDeck.shuffle()
    }
    
    func handOutCard() -> Card? {
        return cardDeck.removeOne()
    }
    
    func makeDealerCard() {
        if let card = handOutCard() {
            dealer.append(card)
        }
    }
}
