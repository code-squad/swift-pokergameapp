//
//  Participant.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class Participant {
    private let gameMode : GameMode
    private var cardsInHands = [Card]()
    
    init(which cardStud: GameMode){
        self.gameMode = cardStud
    }
    
    func isCardsFull() -> Bool {
        return self.gameMode.compareStudNumber(with: self.cardsInHands.count)
    }
    func addCard(newCard: [Card]) {
        self.cardsInHands += newCard
    }
}

class Dealer : Participant {
    
    let cardStudParticipatingIn : Int
    private var cardDeck = CardDeck()
    private var cardsInHands = [Card]()
    
    required init(whichcardStud cardStud: Int) {
        self.cardStudParticipatingIn = cardStud
    }
    
    func distributeCards() -> [Card] {
        var newCards = [Card]()
        for cardCounting in 0 ..< self.cardStudParticipatingIn {
            let pickedCard = cardDeck.removeOne(of: cardCounting)
            newCards.append(pickedCard)
        }
        return newCards
    }
    
    func giveOneCard() -> [Card] {
        var newCard = [Card]()
        newCard.append(cardDeck.removeOne(of: 0))
        return newCard
    }
    
}

class Player : Participant {
    let cardStudParticipatingIn : Int
    private var cardsInHands = [Card]()
    
    required init(whichcardStud cardStud: Int) {
        self.cardStudParticipatingIn = cardStud
    }
    
}
