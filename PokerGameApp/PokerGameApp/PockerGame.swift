//
//  PockerGame.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/17.
//

import Foundation

class PockerGame {
    private var deck: CardDeck
    private var dealer: Dealer
    private var participant: [Participant]
    private var numOfParticipant: Int
    private var numOfCard: Int
    
    init(numOfParticipant: Int, numOfCard: Int) {
        self.numOfParticipant = numOfParticipant
        self.numOfCard = numOfCard
        deck = CardDeck()
        dealer = Dealer()
        participant = Array(repeating: Participant(), count: self.numOfParticipant)
    }
}
