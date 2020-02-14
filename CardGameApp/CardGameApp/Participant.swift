//
//  Participant.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

// 참가자 프로토콜 - cardInHand 랑 isCardFull 메소드 만들기
protocol Participant {
    init(whichcardStud cardStud: Int)
    
    func isCardsFull() -> Bool
}

class Dealer : Participant {
    
    let cardStudParticipatingIn : Int
    private var cardDeck = CardDeck()
    private var cardsInHands = [Card]()
       
    required init(whichcardStud cardStud: Int) {
        self.cardStudParticipatingIn = cardStud
    }
    
    func isCardsFull() -> Bool {
        return self.cardsInHands.count == cardStudParticipatingIn
    }
    
    // 카드 배열을 반환. 게임 진행하는 곳에서 플레이어 객체에게 넣어주기
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
   
    func isCardsFull() -> Bool {
        return self.cardsInHands.count == cardStudParticipatingIn
    }
}
