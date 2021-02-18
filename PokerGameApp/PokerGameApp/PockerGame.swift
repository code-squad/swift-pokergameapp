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
    private var participants: Participants
    private var numOfCard: Int
    
    init(numOfParticipant: Int, numOfCard: Int) {
        self.numOfCard = numOfCard
        deck = CardDeck()
        dealer = Dealer(name: PlayerType.Dealer)
        participants = Participants(numOfParticipant: numOfParticipant)
    }
    
    func gameStart() {
        dealer.distributeCard(participants: participants, numOfCard: self.numOfCard)
    }
    
    func getDealer() -> Dealer {
        return dealer
    }
    
    func getParticipants() -> Participants {
        return participants
    }
}
