//
//  Player.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

class Player : Playable {
    private var deck = Deck()
    private let name = "참가자"
    private let entryNumber : Int

    init(entryNumber : Int) {
        self.entryNumber = entryNumber
    }
    
    func receiveCard(card : Card) {
        deck.receiveCard(card: card)
    }
    
    func showCards() -> PlayerCard {
        let playerCard = PlayerCard(name: "\(name)\(entryNumber)", card: deck)
        return playerCard
    }
    
    func resetCards() {
        deck.resetCard()
    }
    
}
