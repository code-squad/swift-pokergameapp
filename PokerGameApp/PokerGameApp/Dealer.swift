//
//  Dealer.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/18.
//

import Foundation

class Dealer: CustomStringConvertible {
    var description: String{
        return cards.description
    }
    
    private var cardDeck = CardDeck()
    private var cards: [Card]
    
    init() {
        self.cards = [Card]()
        cardDeck.makeCardDeck()
        cardDeck.shuffle()
    }
    
    func handOutCard() -> Card? {
        return cardDeck.removeOne()
    }
    
    func makeDealerCard() {
        if let card = handOutCard() {
            cards.append(card)
        }
    }
    
    func retrieveCard(completion: (Card) -> Void) {
        cards.forEach { (card) in
            completion(card)
        }
    }
}
