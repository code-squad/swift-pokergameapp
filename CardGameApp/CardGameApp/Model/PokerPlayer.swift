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
    var name : String = ""
    
    func addOneCard(newCard: Card) {
        self.cardsInHand.append(newCard)
    }
    
    func showEachCardInHand(behavior: (Card) -> () ) {
        cardsInHand.forEach(behavior)
    }
    
    func decideName(with text: String){
        self.name = text
    }
    
    func describeSelf()-> String {
        return self.name
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
