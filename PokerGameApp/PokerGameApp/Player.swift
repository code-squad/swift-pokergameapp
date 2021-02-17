//
//  Player.swift
//  PokerGameApp
//
//  Created by HOONHA CHOI on 2021/02/16.
//

import Foundation

class Deck {
    private var handCard : [Card] = []
    
    func receiveCard(card : Card) {
        handCard.append(card)
    }
    
    func showCards() -> [Card] {
        return handCard
    }
    
    func resetCard() {
        handCard.removeAll()
    }
    
    func countCard() -> Int {
        return handCard.count
    }
    
    func emptyCard() -> Bool {
        return handCard.isEmpty
    }
}

class Player {
    private var deck = Deck()
    private let gamerType : GamerType
    
    init(type : GamerType) {
        gamerType = type
    }
    
    func receiveCard(card : Card) {
        deck.receiveCard(card: card)
    }
    
    func showCards() -> [Card] {
        return deck.showCards()
    }
    
    func type() -> GamerType {
        return gamerType
    }
}
