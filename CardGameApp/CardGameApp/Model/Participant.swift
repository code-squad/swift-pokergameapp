//
//  Participant.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class Participant {
    var cardsInHand = [Card]()
    
    func addCard(newCard: Card) {
        self.cardsInHand.append(newCard)
    }
    
    func showEachCardInHand(behavior: (Card) -> () ) {
        print("Participant 클래스에서 showEachCardInHand 메소드 Player cardsInHand.count : \(self.cardsInHand.count)")
        
        cardsInHand.forEach(behavior)
    }
}

class Dealer : Participant {
    private var cardDeck = CardDeck()

    func giveOneCard() -> Card {
        return cardDeck.removeOne(of: 0)
    }
    
    func shuffleCardDeck() {
        self.cardDeck.shuffle()
    }
    
}

class Player : Participant {
    
}
