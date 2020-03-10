//
//  Participant.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class PokerPlayer {
    var cardsInHand = [Card]()
    
    func addCard(newCard: Card) {
        self.cardsInHand.append(newCard)
    }
    
    func showEachCardInHand(behavior: (Card) -> () ) {
        cardsInHand.forEach(behavior)
    }
}

class Dealer : PokerPlayer {
    private var cardDeck = CardDeck()

    func giveOneCard() -> Card {
        return cardDeck.removeOne(of: 0)
    }
    
    func shuffleCardDeck() {
        self.cardDeck.shuffle()
    }
}

class Player : PokerPlayer {
}
