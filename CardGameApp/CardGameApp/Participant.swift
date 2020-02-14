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
    
    func distributeCards() {
        <#function body#>
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
