//
//  Dealer.swift
//  CardGameApp
//
//  Created by 신한섭 on 2020/02/11.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Dealer:Player{
    private var cardDeck:CardDeck
    private var stud:PokerGame.Stud
    private var numOfPlayer:PokerGame.NumOfPlayer
    
    init(stud:PokerGame.Stud,numOfPlayer:PokerGame.NumOfPlayer){
        self.cardDeck=CardDeck()
        self.cardDeck.shuffle()
        self.stud=stud
        self.numOfPlayer=numOfPlayer
    }
    
    func deal() -> Card?{
        return self.cardDeck.removeOne()
    }
}
