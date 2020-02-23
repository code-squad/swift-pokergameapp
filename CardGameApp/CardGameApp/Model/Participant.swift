//
//  Participant.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class Participant {
    var cardsInHands = [Card]()
    
//
//    func isCardsFull() -> Bool {
//        return self.gameMode.compareStudNumber(with: self.cardsInHands.count)
//    }
    func addCard(newCard: Card) {
        self.cardsInHands.append(newCard)
    }
}

class Dealer : Participant {
    private var cardDeck = CardDeck()

    func giveOneCard() -> Card {
        return cardDeck.removeOne(of: 0)
    }
    
}

class Player : Participant {
    
}
